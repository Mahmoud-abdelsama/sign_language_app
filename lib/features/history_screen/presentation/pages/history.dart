import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/flutter_tts.dart';
import '../manager/history_cubit.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  FlutterTtsMe flutterTts = FlutterTtsMe();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "History",
          style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp),
        ),
      ),
      body: BlocConsumer<HistoryCubit, HistoryState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is HistorySuccess) {
            return   SingleChildScrollView(
              child:state.model.history!.length == 0 ?  Column(children:[
                SizedBox(height: 300,),

                Center(child: Text("you don't have any \nTranslations history",style: GoogleFonts.poppins(fontSize: 21.sp,color: Colors.black,fontWeight: FontWeight.w500),),)])  :  Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: AppColors.darkWight,
                      height: 680.w,
                      width: double.infinity,
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: state.model.history!.length,
                        itemBuilder: (context, uIndex) {
                          return Container(
                            height: 250.w,
                            child:Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Language",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 16.w,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Spacer(),
                                          IconButton(
                                              onPressed: () {
                                                  flutterTts.speakText("${state.model.history![uIndex].word!.word}");
                                              },
                                              icon: const Icon(CupertinoIcons
                                                  .speaker_1_fill))
                                        ],
                                      ),

                                      SizedBox(
                                        height: 8.w,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "  ${state.model.history![uIndex].word!.word}",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 21.w,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8.w,
                                      ),

                                      Divider(
                                        height: 6.w,
                                        color: AppColors.primaryColor,
                                        endIndent: 80.0.w,
                                        indent: 80.0.w,
                                        thickness: 2,
                                      ),
                                      SizedBox(
                                        height: 8.w,
                                      ),

                                      Row(
                                        children: [
                                          Text(
                                            "Sign",
                                            style: GoogleFonts.poppins(
                                                color: AppColors.primaryColor,
                                                fontSize: 16.w,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8.w,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8, left: 8),
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: state
                                                .model
                                                .history![uIndex]
                                                .images!
                                                .length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                height: 50.w,
                                                width: 100.w,
                                                decoration: BoxDecoration(
                                                    color:
                                                        AppColors.primaryColor,
                                                    border: Border.all(
                                                        color: AppColors
                                                            .primaryColor)),
                                                child: Image.network(state.model.history![uIndex].images![index],fit: BoxFit.fill,),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      // DateTime dateTime = DateTime.parse(dateString);

                                      //String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
                                      SizedBox(
                                        height: 8.w,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Date:${DateFormat('yyyy-MM-dd HH:mm  a').format(DateTime.parse(state.model.history![uIndex].word!.createdAt!))}",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 16.w,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            thickness: 15,
                            height: 20,
                            color: Colors.white,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is HistoryFailure) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text("${state.model.errorMessage}"),
              ),
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ));
          }
        },
      ),
    );
  }
}
