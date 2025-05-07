import 'package:core_component/config/color/color.dart';
import 'package:core_component/config/custom/customField.dart';
import 'package:core_component/config/custom/customPasswordField.dart';
import 'package:core_component/config/custom/custom_button.dart';
import 'package:core_component/config/custom/dividerText.dart';
import 'package:core_component/config/custom/showToast.dart';
import 'package:core_component/config/custom/swalFire.dart';
import 'package:core_component/config/listImage/app_image.dart';
import 'package:core_component/screen/auth/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool isloading = false;
  final _formKey = GlobalKey<FormState>();

  Future<void> registerUser() async {
    final confirmed = await swalFire(
      context: context,
      title: "Konfirmasi",
      message: "Apakah Anda yakin ingin mendaftar dengan email ini?",
    );
    if (confirmed == false) return;
    setState(() {
      isloading = true;
    });
    try {
      await Future.delayed(Duration(seconds: 2));
      final response = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
          );
      showAppSnackBar(
        context: context,
        message: "Berhasil mendaftar",
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
          padding: const EdgeInsets.only(right: 30, left: 30),
          child: ListView(
            children: [
              Center(
                child: Container(
                  width: 352,
                  height: 330,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImage.bgRegister),
                    ),
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
                        if (_passwordController.text !=
                            _confirmPasswordController.text) {
                          return "Password dan konfirmasi password berbeda";
                        }
                        return null;
                      },
                    ),
                    CustomPasswordField(
                      label: 'Konfirmasi Password',
                      handleController: _confirmPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Konfirmasi password tidak boleh kosong';
                        }
                        if (_passwordController.text !=
                            _confirmPasswordController.text) {
                          return "Password dan konfirmasi password berbeda";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
              CustomButton(
                text: "Mendaftar",
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // Semua field valid, lanjutkan login atau proses selanjutnya
                    await registerUser();
                  }
                },
                isLoading: isloading,
                fontSize: 15,
                fontWeight: FontWeight.w700,
                height: 52,
              ),
              SizedBox(height: 40),
              DividerText(text: "Atau daftar menggunakan"),
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
                    onPressed: () {
                      // showToast('Tombol ditekan');
                    },
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sudah punya akun? silahkan',
                    style: GoogleFonts.poppins(),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      ' masuk.',
                      style: GoogleFonts.poppins(color: AppColor.primaryColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
