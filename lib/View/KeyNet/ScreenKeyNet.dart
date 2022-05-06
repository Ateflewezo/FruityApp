import 'package:flutter/material.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:fruity/Helper/colorApp.dart';
import 'package:myfatoorah_flutter/model/initsession/SDKInitSessionResponse.dart';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';

// final String mAPIKey =
//     "rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL";
// live key
final String mAPIKey =
    "rdihYRkPQ1922NG2QYRtq4U69NUHxteS-Jn1p2E3B9odNxhmphbGltcL-5E97l1KqveeTnQjfJ1lTPT7DygVd6glt-gj0DhonHgZ5Qe7QFQyuBrqnYycuMR3perDo6cmwzmcEhgwem8vngjbWH8MhVn3Lehfln-d9V4yO7SEkIWaHKt9fZTNSg71kbcTV1xQv8OHTdwoWzjgCYy7FwZQLsgsdAYeQ0gM51Y-HMzwprOzVE1CAl4gHuFmK0_18n_UIBULQzzWp6fijBjFWjLh-WdQRjvgWnamfTv2hLcNQ_Zxc1VzFFdcyK7_YJxsP9t4KTJl1Ip3mEfDAnklx_uM5KBc8a256RZfGFoCrVIsKP-R4LpMSN1haIojw8ZApeabH0s5FK0kAEelmicdIIx3XB2HhcROrxVzQmwMkM4z88gOyFIauNxgeJcqvvDhCS1KAsM5U3N34TvyNuDHipdHhlpOHUgw72vgJLaa-DlmAPGv_mhYH8yzWK7dDd-MMTPGMCZ9bDuYdX8U0X0oPLgDjZAb1lGVsaCk1D8UB4OGP5-90ik78W_-6-N-OVyX8YcXxTbmVQlYhEr1Er4DqHEP3SyCphj1sT02C6N_M22NsxOeVBIUgNByUtvttntTG9VZ3Pt07g29C-B0egzCKg9LJMpmnNjOjtteSiwGl4WZTbemJj8NP-USVIzN7m1kI32Y-KWUltDTg8bjl59BN6x6_urtRlFYM1MR6xWpAqAHHafQEeERSjz6GSh2tfxxaEKLTPYzTw";

class ScreenKeyNet extends StatefulWidget {
  ScreenKeyNet({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ScreenKeyNetState createState() => _ScreenKeyNetState();
}

class _ScreenKeyNetState extends State<ScreenKeyNet> {
  String _response = '';
  String _loading = "Loading...";

  List<PaymentMethods> paymentMethods = [];
  List<bool> isSelected = [];
  int selectedPaymentMethodIndex = -1;

  String amount = "0.100";
  String cardNumber = "5453010000095489";
  String expiryMonth = "5";
  String expiryYear = "21";
  String securityCode = "100";
  String cardHolderName = "Mahmoud Ibrahim";
  bool visibilityObs = false;
  MFPaymentCardView mfPaymentCardView;

  @override
  void initState() {
    super.initState();

    if (mAPIKey.isEmpty) {
      setState(() {
        _response =
            "Missing API Token Key.. You can get it from here: https://myfatoorah.readme.io/docs/test-token";
      });
      return;
    }

    // TODO, don't forget to init the MyFatoorah Plugin with the following line
    MFSDK.init(MFBaseURL.LIVE, mAPIKey);

    initiatePayment();
    initiateSession();
  }

  /*
    Initiate Payment
   */
  void initiatePayment() {
    var request = new MFInitiatePaymentRequest(
        double.parse(amount), MFCurrencyISO.KUWAIT_KWD);

    MFSDK.initiatePayment(
        request,
        MFAPILanguage.EN,
        (MFResult<MFInitiatePaymentResponse> result) => {
              if (result.isSuccess())
                {
                  setState(() {
                    print(result.response.toJson());
                    _response = ""; //result.response.toJson().toString();
                    paymentMethods.addAll(result.response.paymentMethods);
                    for (int i = 0; i < paymentMethods.length; i++)
                      isSelected.add(false);
                  })
                }
              else
                {
                  setState(() {
                    print(result.error.toJson());
                    _response = result.error.message;
                  })
                }
            });

    setState(() {
      _response = _loading;
    });
  }

  void initiateSession() {
    MFSDK.initiateSession((MFResult<MFInitiateSessionResponse> result) => {
          if (result.isSuccess())
            {mfPaymentCardView.load(result.response)}
          else
            {
              setState(() {
                print(
                    "Response: " + result.error.toJson().toString().toString());
                _response = result.error.message;
              })
            }
        });
  }

  void payWithEmbeddedPayment() {
    var request = MFExecutePaymentRequest.constructor(0.100);
    mfPaymentCardView.pay(
        request,
        MFAPILanguage.EN,
        (String invoiceId, MFResult<MFPaymentStatusResponse> result) => {
              if (result.isSuccess())
                {
                  setState(() {
                    print("invoiceId: " + invoiceId);
                    print("Response: " + result.response.toJson().toString());
                    _response = result.response.toJson().toString();
                  })
                }
              else
                {
                  setState(() {
                    print("invoiceId: " + invoiceId);
                    print("Error: " + result.error.toJson().toString());
                    _response = result.error.message;
                  })
                }
            });

    setState(() {
      _response = _loading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: An.text("الدفع"),
        elevation: 0,
        backgroundColor: ColorApp.whiteColor(context),
        actions: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_forward_ios,
                color: ColorApp.blackColor(context),
              ))
        ],
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  createPaymentCardView(),
                  RaisedButton(
                    color: Colors.lightBlue,
                    textColor: Colors.white,
                    child: Text('Pay (Embedded Payment)'),
                    onPressed: payWithEmbeddedPayment,
                  ),
                  Text(_response),
                ]),
          ),
        ),
      ),
    );
  }

  createPaymentCardView() {
    mfPaymentCardView = MFPaymentCardView(
//      inputColor: Colors.red,
//      labelColor: Colors.yellow,
//      errorColor: Colors.blue,
//      borderColor: Colors.green,
//      fontSize: 14,
//      borderWidth: 1,
//      borderRadius: 10,
//      cardHeight: 220,
//      cardHolderNameHint: "card holder name hint",
//      cardNumberHint: "card number hint",
//      expiryDateHint: "expiry date hint",
//      cvvHint: "cvv hint",
//      showLabels: true,
//      cardHolderNameLabel: "card holder name label",
//      cardNumberLabel: "card number label",
//      expiryDateLabel: "expiry date label",
//      cvvLabel: "cvv label",
        );

    return mfPaymentCardView;
  }
}
