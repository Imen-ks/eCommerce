# eCommerce Application

![featured](https://github.com/Imen-ks/eCommerce/blob/main/eCommerce/Assets.xcassets/eCommerce.png)

Xcode project built in SwiftUI relating to an eCommerce app showcasing fashion products and enabling users to :
- create an account or login to an existing account
- browse the product catalog
- add/remove items to/from their favorites list
- add/remove items to/from their cart
- proceed with payment
- view orders history

Project using [Firebase](https://firebase.google.com/) and [Stripe API](https://stripe.com/).  
App architecture : Repository Design Pattern

## Usage

Open the `eCommerce.xcodeproj` file with Xcode and build the application in the simulator or on a device.

## Swift Package Manager dependencies

### Firebase

This project uses several libraries provided by [Firebase SDK for iOS platforms](https://firebase.google.com/docs/reference/swift/modules) :
- `Authentication` : see the related section below
- `Hosting`: see the related section below
- `Cloud Firestore` : products and users data storage through collections and documents
- `Cloud Storage` : products images upload
- `Analytics` : for logging events that provide insight on app usage and user engagement
- `Remote Config` : used to change the colors of the app without publishing an app update

### Stripe API

This project embeds Stripe iOS SDK and in particular the [StripePaymentSheet](https://stripe.dev/stripe-ios/stripepaymentsheet/documentation/stripepaymentsheet/) module which provides a prebuilt payment UI.  
The payment method integration uses three Stripe API objects :
- `PaymentIntent` : represents the intent to collect payment from a customer during the **Checkout** process. Charge attempts and payment state changes are tracked throughout the process
- `Customer` : the Customer object is created during the **Sign Up** process
- `Customer Ephemeral Key` : grants the SDK temporary access to the Customer

For security reasons, Stripe does not allow the app to create these objects. Instead, this has to be done on a server-side (see related section below).

> [!NOTE]
> Stripe provides [test cards numbers](https://stripe.com/docs/payments/accept-a-payment?platform=ios&ui=payment-sheet&uikit-swiftui=swiftui#ios-test-the-integration) allowing to test the integration through various scenarios.  
> For instance, filling out the credit card form using the credit card number `4242 4242 4242 4242` with any expiration in a future date, CVC, and postal code should lead to a **payment success**.

### Alamofire
This project uses [Alamofire library](https://github.com/Alamofire/Alamofire) to ease HTTP requests between the app and the server.
___

## Authentication
This project uses Firebase Authentication, specifically the [Email and password based authentication](https://firebase.google.com/docs/auth/ios/password-auth) sign-in method.  
In the app, the `AuthenticationManager` class is responsible for authentication state and users related operations such as creation, email or password update, and deletion.

### User registration
To keep things simple, anyone can register by providing an email address and a password.  
Note : the email address does not need to be valid in order to create an account or sign in.

### User email update
This project uses the Firebase method `sendEmailVerification(beforeUpdatingEmail:,actionCodeSettings:)` which sends a verification link to the user's email address. You will therefore need access to a working email account if you wish to test this feature.  
An instance of [ActionCodeSettings](https://firebase.google.com/docs/reference/admin/node/firebase-admin.auth.actioncodesettings.md#properties) is provided when sending the verification email. It includes the following parameters :
- `url` : represents the state/Continue URL in the form of a Universal Link. This link will either open the app directly or redirect to it after the action is handled by Firebase
- `setIOSBundleID` : the bundle identifier of the iOS app
- `handleCodeInApp` : specifies whether the link will open directly in the app or through a Firebase-hosted web widget before redirection
- `linkDomain` : the custom Firebase Hosting domain used to open the link in the app. This replaces Firebase Dynamic Links. If not set, the default hosting domain is used

The link sent by Firebase has the following format :
```
https://<hosting_domain>/__auth/action?apiKey=&mode=&oobCode=&continueUrl=
```  
The [oobCode](https://cloud.google.com/identity-platform/docs/reference/rest/v1/OobReqType) query parameter must be extracted from the deep link and passed to Firebase's `applyActionCode` method for the action to take effect — in this case, verifying the user’s email address.

In this project, the action code is handled directly in the app. SwiftUI receives the Universal Link via the `onOpenURL(perform:)` modifier. The `DeepLinkManager` EnvironmentObject is responsible for handling the link through its `handleFirebaseAuthLink(:)` method.

> [!NOTE]
> The universal link's domain passed to the `ActionCodeSettings` instance must be whitelisted in the Firebase Console.  
> You can do this by navigating to **Authentication > Settings > Authorized domains**.
---

## Firebase Hosting

This project uses the **default email templates** provided by Firebase.  
Firebase Hosting is used in this project to support Universal Links for Firebase Authentication flows such as email verification and email address updates.

Starting **August 25, 2025**, [Firebase Dynamic Links will be deprecated](https://firebase.google.com/support/dynamic-links-faq#impacts-on-email-link-authentication) for email link sign-in and out-of-band actions. As a replacement, Firebase Authentication now relies on **Firebase Hosting domains** to generate secure, app-linkable URLs. This project has been updated accordingly.

### Hosting Setup
Firebase Hosting has been initialized and deployed for this project using the [default hosting configuration](https://firebase.google.com/docs/hosting/quickstart) provided by Firebase.  
Upon setup, the following default domains are provisioned automatically and associated with the project :
- `PROJECT_ID.firebaseapp.com`
- `PROJECT_ID.web.app`

> [!NOTE]
> To enable Universal Links on iOS, both hosting domains have been added to the **Associated Domains** capability of the app target in Xcode :
> - `applinks:PROJECT_ID.firebaseapp.com`
> - `applinks:PROJECT_ID.web.app`

### Apple App Site Association (AASA) File
To establish the domain-to-app trust required by Apple for Universal Links, an `apple-app-site-association` file was created and deployed.
```json
{
  "applinks": {
    "apps": [],
    "details": [
      {
        "appID": "TEAM_ID.BUNDLE_ID",
        "paths": [
          "/__/auth/*"
        ]
      }
    ]
  }
}
```
This file is deployed with :
```
firebase deploy --only hosting
```

### Configuring Firebase to Use Hosting Domains
The **Firebase Admin SDK** is used in combination with **Firebase Functions** to instruct Firebase to generate mobile authentication links using the Hosting domain.

#### `Functions/index.js`:
```js
const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();

exports.setEmailActionDomain = functions.https.onRequest(async (req, res) => {
    const projectConfigManager = admin.auth().projectConfigManager();
    const updateRequest = {
        mobileLinksConfig: {
            domain: 'HOSTING_DOMAIN'
        }
    };
    try {
        await projectConfigManager.updateProjectConfig(updateRequest);
        res.status(200).send("Hosting Domain successfully updated");
    } catch (error) {
        console.error("Error :", error);
        res.status(500).send("Error : " + error.message);
    }
});
```
This function is deployed using :
```
firebase deploy --only functions
```

### Structure overview
```
├── firebase.json
├── public
│   ├── index.html
│   ├── 404.html
│   └── .well-known
│       └── apple-app-site-association
└── functions
    ├── index.js
    ├── package.json
    └── package-lock.json
```
#### `firebase.json` :
```json
{
    "functions": {
        "source": "functions"
    },
    "hosting": {
        "public": "public",
        "headers": [
            {
                "source": "/.well-known/apple-app-site-association",
                "headers": [
                    {
                        "key": "Content-Type",
                        "value": "application/json"
                    }
                ]
            }
        ],
        "appAssociation": "NONE",
        "ignore": [
            "firebase.json",
            "**/.*",
            "!**/.well-known/**",
            "**/node_modules/**"
        ]
    }
}
```
---

## Backend server

As mentioned above, Stripe requires a server-side implementation.  
The server in this project is hosted on [Render](https://render.com) and has **two endpoints**. The source code can be found [here](https://github.com/Imen-ks/eCommerceServer).

1. The `/customers` endpoint creates the Customer object.

2. Additionally, as stated on [Stripe setup](https://stripe.com/docs/payments/accept-a-payment?platform=ios&ui=payment-sheet#add-server-endpoint), the `/checkout` endpoint :
   - retrieves the Customer
   - creates an Ephemeral Key for the Customer
   - creates a PaymentIntent, with the amount, currency, and customer
   - returns the Payment Intent’s client secret, the Ephemeral Key’s secret, the Customer’s id, and the publishable key to the app.

> [!NOTE]
> For performance purposes, Render’s projects sleep after 15 minutes. Therefore, one may experience delay when interacting with the app during the processes involving calls to the server (i.e. `Sign Up` & `Checkout`).
---

## Database

Under the path `eCommerce/Utilities/ProductData`, you can find :
- a folder `/database` containing the datasets set up from scratch that have been used in this project   
- a file `ProductDataManager.swift` defining the methods that have been used to load the data in Firestore

For app leightweihting purpose, the images uploaded in Firestore have not been embedded in this project. However they can be retrieved within the file `ProductDatabase.swift` since the urls related to these images have been added to the `ProductVariant` model.

> [!NOTE]
> Security Rules for both Firestore and Storage have been setup in the Firebase console.
