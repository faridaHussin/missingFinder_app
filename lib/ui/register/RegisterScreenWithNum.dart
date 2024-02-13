// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:missing_finder1/data/di.dart';
// import 'package:missing_finder1/ui/register/RegisterScreenWithEmail.dart';
// import 'package:missing_finder1/ui/register/cubit/Register_States.dart';
//
// import '../../utils/TextFieldItem.dart';
// import 'Personal_ID.dart';
// import 'cubit/RegisterScreenViewModel.dart';
//
// class RegisterScreenWithNum extends StatefulWidget {
//   static const String routeName = 'registerNum';
//
//   RegisterScreenWithNum({super.key});
//
//   @override
//   State<RegisterScreenWithNum> createState() => _RegisterScreenWithNumState();
// }
//
// class _RegisterScreenWithNumState extends State<RegisterScreenWithNum> {
//   RegisterScreenViewModel viewModel =
//       RegisterScreenViewModel(registerUseCase: injectRegisterUseCase());
//
//   @override
//   Widget build(BuildContext context) {
//     var theme = Theme.of(context);
//     return BlocListener<RegisterScreenViewModel, RegisterStates>(
//       bloc: viewModel,
//       listener: (context, state) {},
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Container(
//           height: double.infinity,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('assets/images/background.jpg'),
//               fit: BoxFit.fill,
//             ),
//           ),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(
//                   right: 130,
//                   top: 120,
//                 ),
//                 child: Text('Create\nnew account',
//                     style: theme.textTheme.titleLarge),
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20),
//                 child: Row(
//                   children: [
//                     Text(
//                       'Already A Member?',
//                       style: theme.textTheme.bodyMedium,
//                     ),
//                     SizedBox(
//                       width: 2.w,
//                     ),
//                     GestureDetector(
//                       onTap: () {},
//                       child: Text(
//                         'Log In',
//                         style: theme.textTheme.bodyMedium!
//                             .copyWith(color: Colors.red),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 25,
//               ),
//               SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(right: 100),
//                       child: Text(
//                         'Please enter your mobile number ',
//                         style: theme.textTheme.bodyMedium,
//                       ),
//                     ),
//                     Form(
//                       key: viewModel.forKey,
//                       child: Column(
//                         children: [
//                           TextFieldItem(
//                             hintText: 'Mobile Number',
//                             controller: viewModel.mobileNumber,
//                             validator: (value) {
//                               if (value == null || value.trim().isEmpty) {
//                                 return 'please enter your mobile no';
//                               }
//                               return null;
//                             },
//                             keyboardType: TextInputType.phone,
//                           ),
//                           TextFieldItem(
//                             hintText: 'password',
//                             controller: viewModel.password,
//                             validator: (value) {
//                               if (value == null || value.trim().isEmpty) {
//                                 return 'please enter password';
//                               }
//                               bool emailValid = RegExp(
//                                       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
//                                   .hasMatch(value);
//                               if (!emailValid) {
//                                 return 'invalid password';
//                               }
//                             },
//                             keyboardType: TextInputType.visiblePassword,
//                             isObscure: viewModel.isObscure,
//                             suffixIcon: InkWell(
//                               child: viewModel.isObscure
//                                   ? Icon(Icons.visibility_off)
//                                   : Icon(Icons.visibility),
//                               onTap: () {
//                                 if (viewModel.isObscure) {
//                                   viewModel.isObscure = false;
//                                 } else {
//                                   viewModel.isObscure = true;
//                                 }
//                                 setState(() {});
//                               },
//                             ),
//                           ),
//                           TextFieldItem(
//                             hintText: 'Confirmation password',
//                             controller: viewModel.confirmationPassword,
//                             validator: (value) {
//                               if (value == null || value.trim().isEmpty) {
//                                 return 'please enter rePassword';
//                               }
//                               if (value != viewModel.password.text) {
//                                 return "password doesn't match";
//                               }
//                               return null;
//                             },
//                             keyboardType: TextInputType.visiblePassword,
//                             isObscure: viewModel.isObscure,
//                             suffixIcon: InkWell(
//                               child: viewModel.isObscure
//                                   ? Icon(Icons.visibility_off)
//                                   : Icon(Icons.visibility),
//                               onTap: () {
//                                 if (viewModel.isObscure) {
//                                   viewModel.isObscure = false;
//                                 } else {
//                                   viewModel.isObscure = true;
//                                 }
//                                 setState(() {});
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 25.h,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 50, right: 50),
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.pushReplacementNamed(
//                               context, PersonalID.routeName);
//                         },
//                         child: Text('COUNTINE',
//                             style:
//                                 TextStyle(color: Colors.white, fontSize: 17)),
//                         style: ElevatedButton.styleFrom(
//                           fixedSize: Size(224, 48),
//                           backgroundColor: Color(0xFFE8D6D6).withOpacity(0.5),
//                           shape: RoundedRectangleBorder(
//                             side: BorderSide(color: theme.primaryColor),
//                             borderRadius: BorderRadius.circular(25),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 50, right: 50),
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.pushReplacementNamed(
//                               context, RegisterScreenWithEmail.routeName);
//                         },
//                         child: Text('sign up with email',
//                             style:
//                                 TextStyle(color: Colors.white, fontSize: 17)),
//                         style: ElevatedButton.styleFrom(
//                           fixedSize: Size(224, 48),
//                           backgroundColor: Color(0xFFE8D6D6).withOpacity(0.5),
//                           shape: RoundedRectangleBorder(
//                             side: BorderSide(color: theme.primaryColor),
//                             borderRadius: BorderRadius.circular(25),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// Row(
// children: [
// GestureDetector(
// onTap: () {
// genderIndex = 0;
// setState(() {
// });
// },
// child: Container(
// padding: EdgeInsets.only(
// top: 9,
// ),
// width: 102.w,
// height: 39.h,
// decoration: BoxDecoration(
// borderRadius:
// BorderRadius.circular(30.r),
// color: genderIndex == 0
// ? Color(0xFF0D1516)
//     : Color(0xFFE8D6D6)
//     .withOpacity(0.5),
// ),
// child: Text('Male',
// style: theme.textTheme.bodyMedium,
// textAlign: TextAlign.center),
// ),
// ),
// SizedBox(
// width: 15.w,
// ),
// GestureDetector(
// onTap: () {
// genderIndex = 1;
// setState(() {
// viewModel.gender;
// });
// },
// child: Container(
// padding: EdgeInsets.only(
// top: 9,
// ),
// width: 102.w,
// height: 39.h,
// decoration: BoxDecoration(
// borderRadius:
// BorderRadius.circular(30.r),
// color: genderIndex == 1
// ? Color(0xFF0D1516)
//     : Color(0xFFE8D6D6)
//     .withOpacity(0.5),
// ),
// child: Text('Female',
// style: theme.textTheme.bodyMedium,
// textAlign: TextAlign.center),
// ),
// ),
// ],
// ),
