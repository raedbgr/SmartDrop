import '/imports.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthController authCtrl = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF242529),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 75,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Smart Drop",
                    style: TextStyle(
                      color: Color(0xfffdfefe),
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Column(
                    spacing: 20,
                    children: [
                      InputField(
                        hintText: 'Email',
                        obscureText: false,
                        controller: authCtrl.emailController,
                      ),
                      InputField(
                        hintText: 'Password',
                        obscureText: true,
                        controller: authCtrl.passwordController,
                      ),
                      InputField(
                        hintText: 'Confirm Password',
                        obscureText: true,
                        controller: authCtrl.confirmPasswordController,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (authCtrl.emailController.text.isEmpty ||
                              authCtrl.passwordController.text.isEmpty ||
                              authCtrl.confirmPasswordController.text.isEmpty) {
                            Get.snackbar("Error", "Please fill all fields",
                                snackPosition: SnackPosition.BOTTOM);
                            return;
                          } else if (authCtrl.passwordController.text !=
                              authCtrl.confirmPasswordController.text) {
                            Get.snackbar("Error", "Passwords do not match",
                                snackPosition: SnackPosition.BOTTOM);
                          } else {
                            authCtrl.register(
                              authCtrl.emailController.text,
                              authCtrl.passwordController.text,
                            );
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xff242529),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: const Color(0xFFb3c3c0),
                            ),
                          ),
                          child: const Text(
                            'Register',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xfffdfefe),
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already a member? ',
                              style: TextStyle(
                                color: Color(0xffb3c3c0),
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              )),
                          GestureDetector(
                            onTap: () {
                              Get.offAllNamed('/login');
                            },
                            child: const Text('Login here',
                                style: TextStyle(
                                  color: Color(0xfffdfefe),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
