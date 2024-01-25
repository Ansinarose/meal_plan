import 'package:flutter/material.dart';

class Screen_about extends StatefulWidget {
  const Screen_about({Key? key}) : super(key: key);

  @override
  State<Screen_about> createState() => _Screen_aboutState();
}

class _Screen_aboutState extends State<Screen_about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 250, 226, 6),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/about.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: Text(
                  "Welcome to Meal Planner!\n\n"
                  "At HealthMeal Planner, we believe that a healthy lifestyle begins with mindful nutrition. "
                  "Our app is designed to simplify your journey towards better health by providing specialized healthier meal plans tailored to your needs.\n\n"
                  "Key Features:\n\n"
                  "1.variety Meal Plans: Provides meal plans based on dietary preferences, health goals, and nutritional requirements.Everyday provides defferent meal plans so that the user did not feels any repetition\n\n"
                  "2.Nutrient-Rich Recipes: Explore a variety of delicious and nutritious recipes curated by health experts to support your well-being.\n\n"
                  "3.Feedback session: Provides a feedback session so that user can write the feedback about each day be self.It improves the confidence and takepart in the field of healthier way.\n\n"
                  "4.Evaluation Tracking: Monitor your health progress and track your meals, ensuring you stay on the path to your fitness goals.\n\n"
                  "Why Choose HealthMeal Planner?\n\n"
                  "Our team of nutritionists and chefs collaborates to bring you a seamless meal planning experience. "
                  "We prioritize your health and convenience, making it easier than ever to make nutritious choices.\n\n"
                  "Contact Us:\n\n"
                  "Have questions, suggestions, or feedback? We'd love to hear from you! Reach out to our support team at support@mealplanner.com.\n\n"
                  "Join us on the journey to a healthier, happier you with HealthMeal Planner!",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
