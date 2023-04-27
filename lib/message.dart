import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class MessageFeature {

  void findMatchingPlayer() {

    // I(P1, P2) = 3.5(ap1 - ap2) + 2.5(bp1 - bp2) + 2(cp1 - cp2) + (dp1 - dp2) + (ep1 - ep2)

  }

  void findPercentMatchPlayer() {

    // I(pMax, pMin) = 3.5(5) + 2.5(5) + 2(5) +5 +5
    // I(pMax, pMin) = 50
    //
    // 100/50 =2
    //
    // 100 - (50 * 2) = 0.0% match

  }
}
