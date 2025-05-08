import 'package:core_component/config/custom/customField.dart';
import 'package:core_component/config/custom/customPasswordField.dart';
import 'package:core_component/config/custom/custom_button.dart';
import 'package:core_component/config/custom/dividerText.dart';
import 'package:core_component/config/custom/showToast.dart';
import 'package:core_component/config/listImage/app_image.dart';
import 'package:core_component/routes/app_routes_named.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({super.key});

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  bool isloading = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Future<void> loginUser() async {
    setState(() {
      isloading = true;
    });
    try {
      await Future.delayed(Duration(seconds: 2));
      final response = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text, // yandiriswandi@gmail.com
        password: _passwordController.text, // Pass1234!
      );
      Get.offAllNamed(AppRoutesNamed.pageMain);
      showAppSnackBar(
        context: context,
        message: "Berhasil login",
        backgroundColor: Colors.green,
        icon: Icons.check_circle,
      );
    } on FirebaseAuthException catch (e) {
      showAppSnackBar(context: context, message: "${e.message}");
    } catch (e) {
      showAppSnackBar(context: context, message: "Terjadi kesalahan sistem");
    } finally {
      setState(() {
        isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: ListView(
            children: [
              Center(
                child: Container(
                  width: 352,
                  height: 330,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(AppImage.bgLogin)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomField(
                      label: 'Masukkan Email',
                      handleController: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    CustomPasswordField(
                      label: 'Password',
                      handleController: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text("Lupa Password?", style: GoogleFonts.poppins()),
              ),
              SizedBox(height: 20),
              CustomButton(
                text: "Masuk",
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // Semua field valid, lanjutkan login atau proses selanjutnya
                    await loginUser();
                  }
                },
                isLoading: isloading,
                fontSize: 15,
                fontWeight: FontWeight.w700,
                height: 52,
              ),

              SizedBox(height: 40),
              DividerText(text: "Atau masuk menggunakan"),
              SizedBox(height: 40),
              Material(
                color: Colors.white,
                child: SizedBox(
                  height: 52,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      surfaceTintColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 33,
                          height: 33,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(AppIcon.iconGoogle),
                            ),
                          ),
                        ),

                        Text(
                          'Google',
                          style: GoogleFonts.poppins(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 49),
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Text(
                    'Belum punya akun? silahkan',
                    style: GoogleFonts.poppins(),
                  ),
                  InkWell(
                    onTap: () {
                      Get.offNamed(AppRoutesNamed.pageRegister);
                    },
                    child: Text(
                      ' Mendaftar. ',
                      style: GoogleFonts.poppins(color: Color(0xff3498DB)),
                    ),
                  ),
                  Text('sekarang', style: GoogleFonts.poppins()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
