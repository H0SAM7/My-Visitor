// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:my_visitor/core/styles/text_styles.dart';
// import 'package:my_visitor/features/resturants/data/models/resturant_model/datum.dart';

// class ResturantItem extends StatelessWidget {
//   const ResturantItem({
//     super.key,
//     required this.restaurantModel,
//   });
//   final Datum restaurantModel;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () async {
//         // await BlocProvider.of<MenuCubit>(context)
//         //     .getMenu(quary: restaurantModel.quary);

//         // Navigator.pushNamed(context, MenuItemsView.id,arguments: restaurantModel);
//       },
//       child: Card(
//         color: Colors.white,
//         elevation: 4,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: 150.h,
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 color: Colors.grey,
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
//               ),
//               child: Image.network(
//                 restaurantModel!
//                         .thumbnail!.photo!.photoSizeDynamic!.urlTemplate! ??
//                     'https://th.bing.com/th/id/R.26f677899cb906831538311cac52504e?rik=s0GOw2btDQt1tQ&pid=ImgRaw&r=0',
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     restaurantModel.name ?? '',
//                     // 'Rose Garden Restaurant',
//                     style: AppStyles.style22White(context).copyWith(
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     'menu',
//                     // 'Burger - Chiken - Riche - Wings',
//                     style: AppStyles.style16Gray(context).copyWith(
//                         color: Colors.grey, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: [
//                       const Icon(Icons.star, color: Colors.orange, size: 20),
//                       const SizedBox(width: 4),
//                       Text('restaurantModel.rate'),
//                       const SizedBox(width: 16),
//                       const Icon(Icons.delivery_dining,
//                           color: Colors.orange, size: 20),
//                       const SizedBox(width: 4),
//                       const Text('Free'),
//                       const SizedBox(width: 16),
//                       const Icon(Icons.access_time,
//                           color: Colors.orange, size: 20),
//                       const SizedBox(width: 4),
//                       Text('restaurantModel.time'),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
