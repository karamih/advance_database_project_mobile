import 'package:advance_db_class_mobile/services/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/branch_model.dart';

class CafeBranch extends StatefulWidget {
  const CafeBranch({super.key});

  @override
  State<CafeBranch> createState() => _CafeBranchState();
}

class _CafeBranchState extends State<CafeBranch> {
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();

  ApiProvider apiProvider = ApiProvider();
  late Future<List<BranchModel>> branchData = Future.value([]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background.png'),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 120, 10, 120),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(0xFF3D73D1),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(15)),
                          color: Color(0xFF113EA7)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 14, 8, 12),
                        child: Text(
                          'Branches',
                          style: GoogleFonts.jetBrainsMono(
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 65,
                          child: Row(
                            children: [
                              Expanded(
                                  child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Country: ',
                                    style: GoogleFonts.jetBrainsMono(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Colors.white),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: const Color(0xFF8BB3E8),
                                    ),
                                    child: TextField(
                                      controller: _countryController,
                                      style: GoogleFonts.jetBrainsMono(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Colors.black),
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Iran',
                                          contentPadding:
                                              const EdgeInsets.only(left: 10),
                                          hintStyle: GoogleFonts.jetBrainsMono(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              color: Colors.black54)),
                                    ),
                                  )
                                ],
                              )),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'State: ',
                                    style: GoogleFonts.jetBrainsMono(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Colors.white),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: const Color(0xFF8BB3E8),
                                    ),
                                    child: TextField(
                                      controller: _stateController,
                                      style: GoogleFonts.jetBrainsMono(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Colors.black),
                                      decoration: InputDecoration(
                                          hintText: 'Tehran',
                                          contentPadding:
                                              const EdgeInsets.only(left: 10),
                                          border: InputBorder.none,
                                          hintStyle: GoogleFonts.jetBrainsMono(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              color: Colors.black54)),
                                    ),
                                  )
                                ],
                              )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Map<String, dynamic> data = {
                                "country": _countryController.text,
                                "state": _stateController.text
                              };
                              setState(() {
                                branchData = apiProvider.getBranches(data);
                              });
                            },
                            child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color(0xFF8BB3E8)),
                                child: Center(
                                  child: Text(
                                    'OK',
                                    style: GoogleFonts.jetBrainsMono(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Branches: ',
                                style: GoogleFonts.jetBrainsMono(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: const Color(0xFF8BB3E8)),
                                  child: FutureBuilder<List<BranchModel>>(
                                    future: branchData,
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      } else if (snapshot.hasError) {
                                        return const Center(
                                          child: Text(
                                            'Something is wrong!',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
                                        );
                                      } else if (snapshot.hasData) {
                                        List<BranchModel>? data = snapshot.data;
                                        return ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemCount: data!.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 5, 10),
                                              child: SizedBox(
                                                width: double.infinity,
                                                height: 30,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${data[index].aCity}-${data[index].aStreet}-${data[index].aPhoneNo.toString()}",
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black),
                                                    ),
                                                    const SizedBox(
                                                      height: 3,
                                                    ),
                                                    const Divider(
                                                      height: 1.5,
                                                      color: Colors.black,
                                                      thickness: 1.5,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      } else {
                                        return const Center(
                                          child: Text(
                                            "There is nothing!",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/2byte_2.png'),
          )
        ],
      ),
    );
  }
}
