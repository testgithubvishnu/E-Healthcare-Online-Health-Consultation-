import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_healthcare_application/consts/consts.dart';
import 'package:e_healthcare_application/res/components/custom_button.dart';
import 'package:e_healthcare_application/views/book_appointment_view.dart/book_appointment_view.dart';
import 'package:get/get.dart';

class DoctorProfileView extends StatelessWidget {
  final DocumentSnapshot doc;

  const DoctorProfileView({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    // used in book_appointment_view
    // var controller = Get.put(AppointmentController());

    return Scaffold(
      backgroundColor: AppColors.bgDarkColor,

      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        title: AppStyles.bold(
            title: "Doctor Details",
            color: AppColors.whiteColor,
            size: AppSizes.size18),
      ), // App

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              padding: const EdgeInsets.all(12),
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ), // BoxDecoration
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: Image.asset(
                      AppAssets.imgSignup,
                    ),
                  ),
                  10.widthBox,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppStyles.bold(
                            title: doc['docName'],
                            color: AppColors.textColor,
                            size: AppSizes.size16),
                        AppStyles.bold(
                          title: doc['docCategory'],
                          color: AppColors.textColor.withOpacity(0.5),
                          size: AppSizes.size14,
                        ),
                        const Spacer(),
                        VxRating(
                          selectionColor: AppColors.yellowColor,
                          onRatingUpdate: (value) {},
                          maxRating: 5,
                          count: 5,
                          value: double.parse(doc['docRating']),
                          stepInt: true,
                        )
                      ],
                    ),
                  ),
                  AppStyles.bold(
                      title: "See all reviews",
                      color: AppColors.blueColor,
                      size: AppSizes.size16),
                ],
              ), // Row
            ),
            10.widthBox,
            Padding(
              padding: const EdgeInsets.fromLTRB(1, 12, 1, 1),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.whiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      tileColor: AppColors.whiteColor,
                      title: AppStyles.bold(
                          title: "Phone number", color: AppColors.textColor),
                      subtitle: AppStyles.normal(
                          title: doc['docPhone'],
                          color: AppColors.textColor.withOpacity(0.5),
                          size: AppSizes.size12),
                      trailing: Container(
                        width: 50,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.yellowColor,
                        ),
                        child: Icon(
                          Icons.phone,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                    10.heightBox,
                    AppStyles.bold(
                        title: "About",
                        color: AppColors.textColor,
                        size: AppSizes.size16),
                    5.heightBox,
                    AppStyles.normal(
                        title: doc['docAbout'],
                        color: AppColors.textColor.withOpacity(.5),
                        size: AppSizes.size12),
                    10.heightBox,
                    AppStyles.bold(
                        title: "Address",
                        color: AppColors.textColor,
                        size: AppSizes.size16),
                    5.heightBox,
                    AppStyles.normal(
                        title: doc['docAddress'],
                        color: AppColors.textColor.withOpacity(.5),
                        size: AppSizes.size12),
                    10.heightBox,
                    AppStyles.bold(
                        title: "Working time",
                        color: AppColors.textColor,
                        size: AppSizes.size16),
                    5.heightBox,
                    AppStyles.normal(
                        title: doc['docTiming'],
                        color: AppColors.textColor.withOpacity(0.5),
                        size: AppSizes.size12),
                    10.heightBox,
                    AppStyles.bold(
                        title: "Services",
                        color: AppColors.textColor,
                        size: AppSizes.size16),
                    5.heightBox,
                    AppStyles.normal(
                        title: doc['docService'],
                        color: AppColors.textColor.withOpacity(0.5),
                        size: AppSizes.size12),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: CustomButton(
            buttonText: "Book an appointment",
            onTap: () {
              Get.to(() => BookAppointmentView(
                    docId: doc['docid'],
                    docName: doc['docName'],
                  ));
            }),
      ), // Column
    ); // Scaffold
  }
}
