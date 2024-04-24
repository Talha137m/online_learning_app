// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:classes_app/config/BaseURL.dart';
// import 'package:onesignal_flutter/onesignal_flutter.dart';

// class Splash extends StatefulWidget {
//   @override
//   _SplashState createState() => _SplashState();
// }

// class _SplashState extends State<Splash> {
//   late SharedPreferences sharedPrefs;

//   String _debugLabelString = "";
//   String? _emailAddress;
//   String? _externalUserId;
//   bool _enableConsentButton = false;

//   // CHANGE THIS parameter to true if you want to test GDPR privacy consent
//   bool _requireConsent = true;

//   startTime() async {
//     var _duration = new Duration(seconds: 2);
//     return new Timer(_duration, navigationPage);
//   }

//   void navigationPage() {
//     Navigator.of(context).pushReplacementNamed((sharedPrefs != null &&
//             sharedPrefs.containsKey(BaseURL.KEY_IS_LOGIN) &&
//             sharedPrefs.getBool(BaseURL.KEY_IS_LOGIN)!)
//         ? '/home'
//         : "/login");
//     //(sharedPrefs.getBool(BaseURL.KEY_IS_LOGIN)) ? '/home' : "/login"
//   }

//   @override
//   void initState() {
//     super.initState();
//     SharedPreferences.getInstance().then((prefs) {
//       setState(() => sharedPrefs = prefs);
//       //startTime();
//       navigationPage();
//     });
//     initPlatformState();
//   }

//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initPlatformState() async {
//     if (!mounted) return;

//     OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

//     OneSignal.shared.setRequiresUserPrivacyConsent(_requireConsent);

//     var settings = {
//       OSiOSSettings.autoPrompt: false,
//       OSiOSSettings.promptBeforeOpeningPushUrl: true
//     };

//     OneSignal.shared
//         .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
//       print("setNotificationOpenedHandler");
//       this.setState(() {
//         _debugLabelString =
//             "Opened notification: \n${result.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
//       });
//     });

//     OneSignal.shared
//         .setInAppMessageClickedHandler((OSInAppMessageAction action) {
//       print("setInAppMessageClickedHandler");
//       this.setState(() {
//         _debugLabelString =
//             "In App Message Clicked: \n${action.jsonRepresentation().replaceAll("\\n", "\n")}";
//       });
//     });

//     OneSignal.shared
//         .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
//       print("SUBSCRIPTION STATE CHANGED: ${changes.jsonRepresentation()}");
//     });

//     OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
//       print("PERMISSION STATE CHANGED: ${changes.jsonRepresentation()}");
//     });

//     OneSignal.shared.setEmailSubscriptionObserver(
//         (OSEmailSubscriptionStateChanges changes) {
//       print("EMAIL SUBSCRIPTION STATE CHANGED ${changes.jsonRepresentation()}");
//     });

//     OneSignal.shared.setAppId("d94d0cb3-fcd4-4db1-b576-516a222722a8");

//     // the SDK will now initialize
//     OneSignal.shared.consentGranted(true).then((oneValue) {
//       _handlePromptForPushPermission();
//     });

//     bool requiresConsent = await OneSignal.shared.requiresUserPrivacyConsent();

//     this.setState(() {
//       _enableConsentButton = requiresConsent;
//     });

//     // Some examples of how to use In App Messaging public methods with OneSignal SDK
//     oneSignalInAppMessagingTriggerExamples();

//     // Some examples of how to use Outcome Events public methods with OneSignal SDK
//     oneSignalOutcomeEventsExamples();
//   }

//   void _handleGetTags() {
//     OneSignal.shared.getTags().then((tags) {
//       if (tags == null) return;

//       setState((() {
//         _debugLabelString = "$tags";
//       }));
//     }).catchError((error) {
//       setState(() {
//         _debugLabelString = "$error";
//       });
//     });
//   }

//   void _handleSendTags() {
//     print("Sending tags");
//     Map<String, dynamic> tagList = {
//       "classis_1": "1",
//     };
//     OneSignal.shared.sendTags(tagList).then((response) {
//       print("Successfully sent tags with response: $response");
//     }).catchError((error) {
//       print("Encountered an error sending tags: $error");
//     });
//   }

//   void _handlePromptForPushPermission() {
//     print("Prompting for Permission");
//     OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
//       print("Accepted permission: $accepted");
//       _handleSendTags();
//     });
//   }

//   oneSignalInAppMessagingTriggerExamples() async {
//     /// Example addTrigger call for IAM
//     /// This will add 1 trigger so if there are any IAM satisfying it, it
//     /// will be shown to the user
//     OneSignal.shared.addTrigger("trigger_1", "one");

//     /// Example addTriggers call for IAM
//     /// This will add 2 triggers so if there are any IAM satisfying these, they
//     /// will be shown to the user
//     Map<String, Object> triggers = new Map<String, Object>();
//     triggers["trigger_2"] = "two";
//     triggers["trigger_3"] = "three";
//     OneSignal.shared.addTriggers(triggers);

//     // Removes a trigger by its key so if any future IAM are pulled with
//     // these triggers they will not be shown until the trigger is added back
//     OneSignal.shared.removeTriggerForKey("trigger_2");

//     // Get the value for a trigger by its key
//     Object? triggerValue =
//         await OneSignal.shared.getTriggerValueForKey("trigger_3");
//     print("'trigger_3' key trigger value: " + triggerValue.toString());

//     // Create a list and bulk remove triggers based on keys supplied
//     List<String> keys = [];
//     keys.add("trigger_1");
//     keys.add("trigger_3");
//     OneSignal.shared.removeTriggersForKeys(keys);

//     // Toggle pausing (displaying or not) of IAMs
//     OneSignal.shared.pauseInAppMessages(false);
//   }

//   oneSignalOutcomeEventsExamples() async {
//     // Await example for sending outcomes
//     outcomeAwaitExample();

//     // Send a normal outcome and get a reply with the name of the outcome
//     OneSignal.shared.sendOutcome("normal_1");
//     OneSignal.shared.sendOutcome("normal_2").then((outcomeEvent) {
//       print(outcomeEvent.jsonRepresentation());
//     });

//     // Send a unique outcome and get a reply with the name of the outcome
//     OneSignal.shared.sendUniqueOutcome("unique_1");
//     OneSignal.shared.sendUniqueOutcome("unique_2").then((outcomeEvent) {
//       print(outcomeEvent.jsonRepresentation());
//     });

//     // Send an outcome with a value and get a reply with the name of the outcome
//     OneSignal.shared.sendOutcomeWithValue("value_1", 3.2);
//     OneSignal.shared.sendOutcomeWithValue("value_2", 3.9).then((outcomeEvent) {
//       print(outcomeEvent.jsonRepresentation());
//     });
//   }

//   Future<void> outcomeAwaitExample() async {
//     var outcomeEvent = await OneSignal.shared.sendOutcome("await_normal_1");
//     print(outcomeEvent.jsonRepresentation());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: new Center(
//         child: new Text("this is splash"),
//       ),
//     );
//   }
// }
