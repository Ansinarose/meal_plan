
import 'package:flutter/material.dart';


 class ScreenPrivacyPolicy extends StatefulWidget {
   const ScreenPrivacyPolicy({Key? key}) : super(key: key);

   @override
   State<ScreenPrivacyPolicy> createState() => _ScreenPrivacyPolicyState();
 }

 class _ScreenPrivacyPolicyState extends State<ScreenPrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 250, 226, 6),
        
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Privacy Policy for Meal Planner',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16.0),
           
                       Text(
              '1. Information We Collect:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'We may collect the following information when you use our app:\n\n'
              '- Name\n'
              '- Age\n'
              '- Height\n'
              '- Weight\n'
              '- Feedback provided by the user\n'
              '- Evaluation results',
            ),
            SizedBox(height: 16.0),
            Text(
              '2. How We Use the Information:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'We use the collected information to:\n\n'
              '- Track and monitor health progress using Evaluation key provided\n'
              '- Analyze feedback to improve user experience\n'
              '- Provide support and respond to user inquiries',
            ),
            SizedBox(height: 16.0),
            Text(
              '3. Data Security:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'We take measures to ensure the security of your data. However, please be aware that no method of transmission over the internet or electronic storage is 100% secure.',
            ),
            SizedBox(height: 16.0),
            Text(
              '4. Third-Party Services:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'We do not use third-party services for analytics, advertising, or other purposes. Please review the privacy policies of those services for more information.',
            ),
            SizedBox(height: 16.0),
            Text(
              '5. Changes to This Privacy Policy:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'We may update our privacy policy from time to time. Any changes will be posted on this page with an updated effectively',
            ),
          ],
        ),
      ),
    );
  }
}
