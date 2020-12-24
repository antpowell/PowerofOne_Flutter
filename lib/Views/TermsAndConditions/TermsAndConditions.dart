import 'package:flutter/material.dart';
import 'package:power_one/Views/LoginSignUp/SigninSignup.dart';
import 'package:power_one/Views/Buttons/PO1Button.dart';

void main() => runApp(TermsAndConditions());

class TermsAndConditions extends StatelessWidget {
  static final String id = 'terms_and_conditions';
  const TermsAndConditions({Key key, this.title}) : super(key: key);
  final title;

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text(
          'Terms and Conditions',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                        "END USER LICENSE AGREEMENT\n"
                        "Last updated April 22, 2020\n"
                        "Power of 1 is licensed to You (End-User) by Power of 1 Sport LLC, located at 5380 W. 34th Street, # 302, Houston, Texas 77092, United States (hereinafter: Licensor), for use only under the terms of this License Agreement.\n"
                        "By downloading the Application from the Apple AppStore, and any update thereto (as permitted by this License Agreement), You indicate that You agree to be bound by all of the terms and conditions of this License Agreement, and that You accept this License Agreement.\n"
                        "The parties of this License Agreement acknowledge that Apple is not a Party to this License Agreement and is not bound by any provisions or obligations with regard to the Application, such as warranty, liability, maintenance and support thereof. Power of 1 Sport LLC, not Apple, is solely responsible for the licensed Application and the content thereof.\n"
                        "This License Agreement may not provide for usage rules for the Application that are in conflict with the latest App Store Terms of Service. Power of 1 Sport LLC acknowledges that it had the opportunity to review said terms and this License Agreement is not conflicting with them.\n"
                        "All rights not expressly granted to You are reserved.\n"
                        "1. THE APPLICATION\n"
                        "Power of 1 (hereinafter: Application) is a piece of software created to Increase skills and knowledge of basketball for amateur athletes. - and customized for Apple mobile devices. It is used to To help basketball players understand their skill level to improve their overall game play.\n"
                        "The Application is not tailored to comply with industry-specific regulations (Health Insurance Portability and Accountability Act (HIPAA), Federal Information Security Management Act (FISMA), etc.), so if your interactions would be subjected to such laws, you may not use this Application. You may not use the Application in a way that would violate the Gramm-Leach-Bliley Act (GLBA).\n"
                        "2. SCOPE OF LICENSE\n"
                        "2.1  You are given a non-transferable, non-exclusive, non-sublicensable license to install and use the Licensed Application on any Apple-branded Products that You (End-User) own or control and as permitted by the Usage Rules set forth in this section and the App Store Terms of Service, with the exception that such licensed Application may be accessed and used by other accounts associated with You (End-User, The Purchaser) via Family Sharing or volume purchasing.\n"
                        "2.2  This license will also govern any updates of the Application provided by Licensor that replace, repair, and/or supplement the first Application, unless a separate license is provided for such update in which case the terms of that new license will govern.\n"
                        "2.3  You may not share or make the Application available to third parties (unless to the degree allowed by the Apple Terms and Conditions, and with Power of 1 Sport LLC's prior written consent), sell, rent, lend, lease or otherwise redistribute the Application.\n"
                        "2.4  You may not reverse engineer, translate, disassemble, integrate, decompile, integrate, remove, modify, combine, create derivative works or updates of, adapt, or attempt to derive the source code of the Application, or any part thereof (except with Power of 1 Sport LLC's prior written consent).\n"
                        "2.5  You may not copy (excluding when expressly authorized by this license and the Usage Rules) or alter the Application or portions thereof. You may create and store copies only on devices that You own or control for backup keeping under the terms of this license, the App Store Terms of Service, and any other terms and conditions that apply to the device or software used. You may not remove any intellectual property notices. You acknowledge that no unauthorized third parties may gain access to these copies at any time.\n"
                        "2.6  Violations of the obligations mentioned above, as well as the attempt of such infringement, may be subject to prosecution and damages\n"
                        "2.7  Licensor reserves the right to modify the terms and conditions of licensing.\n"
                        "2.8  Nothing in this license should be interpreted to restrict third-party terms. When using the Application, You must ensure that You comply with applicable third-party terms and conditions.\n"
                        "3. TECHNICAL REQUIREMENTS\n"
                        "3.1  Licensor attempts to keep the Application updated so that it complies with modified/new versions of the firmware and new hardware. You are not granted rights to claim such an update.\n"
                        "3.2  You acknowledge that it is Your responsibility to confirm and determine that the app end-user device on which You intend to use the Application satisfies the technical  specifications mentioned above.\n"
                        "3.3  Licensor reserves the right to modify the technical specifications as it sees appropriate at any time.\n"
                        "4. MAINTENANCE AND SUPPORT\n"
                        "4.1  The Licensor is solely responsible for providing any maintenance and support services for this licensed Application. You can reach the Licensor at the email address listed in the App Store Overview for this licensed Application.\n"
                        "4.2  Power of 1 Sport LLC and the End-User acknowledge that Apple or Google has no obligation whatsoever to furnish any maintenance and support services with respect to the licensed Application\n"
                        "5. USER GENERATED CONTRIBUTIONS\n"
                        "The Application does not offer users to submit or post content. We may provide you with the opportunity to create, submit, post, display, transmit, perform, publish, distribute, or broadcast content and materials to us or in the Application, including but not limited to text, writings, video, audio, photographs, graphics, comments, suggestions, or personal information or other material (collectively, Contributions). Contributions may be viewable by other users of the Application and through third-party websites or applications. As such, any Contributions you transmit may be treated in accordance with the Application Privacy Policy. When you create or make available any Contributions, you thereby represent and warrant that\n"
                        "1. The creation, distribution, transmission, public display, or performance, and the accessing, downloading, or copying of your Contributions do not and will not infringe the proprietary rights, including but not limited to the copyright, patent, trademark, trade secret, or moral rights of any third party.\n"
                        "2. You are the creator and owner of or have the necessary licenses, rights, consents, releases, and permissions to use and to authorize us, the Application, and other users of the Application to use your Contributions in any manner contemplated by the Application and these Terms of Use.\n"
                        "3. You have the written consent, release, and/or permission of each and every identifiable individual person in your Contributions to use the name or likeness or each and every such identifiable individual person to enable inclusion and use of your Contributions in any manner contemplated by the Application and these Terms of Use.\n"
                        "4. Your Contributions are not false, inaccurate, or misleading.\n"
                        "5. Your Contributions are not unsolicited or unauthorized advertising, promotional materials, pyramid schemes, chain letters, spam, mass mailings, or other forms of solicitation.\n"
                        "6. Your Contributions are not obscene, lewd, lascivious, filthy, violent, harassing, libelous, slanderous, or otherwise objectionable (as determined by us).\n"
                        "7. Your Contributions do not ridicule, mock, disparage, intimidate, or abuse anyone.\n"
                        "8. Your Contributions are not used to harass or threaten (in the legal sense of those terms) any other person and to promote violence against a specific person or class of people.\n"
                        "9. Your Contributions do not violate any applicable law, regulation, or rule.\n"
                        "10. Your Contributions do not violate the privacy or publicity rights of any third party.\n"
                        "11. Your Contributions do not contain any material that solicits personal information from anyone under the age of 18 or exploits people under the age of 18 in a sexual or violent manner.\n"
                        "12. Your Contributions do not violate any applicable law concerning child pornography, or otherwise intended to protect the health or well-being of minors\n"
                        "13. Your Contributions do not include any offensive comments that are connected to race, national origin, gender, sexual preference, or physical handicap.\n"
                        "14. Your Contributions do not otherwise violate, or link to material that violates, any provision of these Terms of Use, or any applicable law or regulation.\n"
                        "Any use of the Application in violation of the foregoing violates these Terms of Use and may result in, among other things, termination or suspension of your rights to use the Application.\n"
                        "6. CONTRIBUTION LICENSE\n"
                        "You agree that we may access, store, process, and use any information and personal data that you provide following the terms of the Privacy Policy and your choices (including settings).\n"
                        "By submitting suggestions of other feedback regarding the Application, you agree that we can use and share such feedback for any purpose without compensation to you.\n"
                        "We do not assert any ownership over your Contributions. You retain full ownership of all of your Contributions and any intellectual property rights or other proprietary rights associated with your Contributions. We are not liable for any statements or representations in your Contributions provided by you in any area in the Application. You are solely responsible for your Contributions to the Application and you expressly agree to exonerate us from any and all responsibility and to refrain from any legal action against us regarding your Contributions.\n"
                        "7. LIABILITY\n"
                        "7.1  Licensor's responsibility in the case of violation of obligations and tort shall be limited to intent and gross negligence. Only in case of a breach of essential contractual duties (cardinal obligations), Licensor shall also be liable in case of slight negligence. In any case, liability shall be limited to the foreseeable, contractually typical damages. The limitation mentioned above does not apply to injuries to life, limb, or health.\n"
                        "7.2  Licensor takes no accountability or responsibility for any damages caused due to a breach of duties according to Section 2 of this Agreement. To avoid data loss, You are required to make use of backup functions of the Application to the extent allowed by applicable third-party terms and conditions of use. You are aware that in case of alterations or manipulations of the Application, You will not have access to licensed Application.\n"
                        "8. WARRANTY\n"
                        "8.1  Licensor warrants that the Application is free of spyware, trojan horses, viruses, or any other malware at the time of Your download. Licensor warrants that the Application works as described in the user documentation.\n"
                        "8.2  No warranty is provided for the Application that is not executable on the device, that has been unauthorizedly modified, handled inappropriately or culpably, combined or installed with inappropriate hardware or software, used with inappropriate accessories, regardless if by Yourself or by third parties, or if there are any other reasons outside of Power of 1 Sport LLC's sphere of influence that affect the executability of the Application.\n"
                        "8.3  You are required to inspect the Application immediately after installing it and notify Power of 1 Sport LLC about issues discovered without delay by e-mail provided in Product Claims. The defect report will be taken into consideration and further investigated if it has been mailed within a period of ninety (90) days after discovery.\n"
                        "8.4  If we confirm that the Application is defective, Power of 1 Sport LLC reserves a choice to remedy the situation either by means of solving the defect or substitute delivery.\n"
                        "8.5  In the event of any failure of the Application to conform to any applicable warranty, You may notify the App-Store-Operator, and Your Application purchase price will be refunded to You. To the maximum extent permitted by applicable law, the App-Store-Operator will have no other warranty obligation whatsoever with respect to the App, and any other losses, claims, damages, liabilities, expenses and costs attributable to any negligence to adhere to any warranty.\n"
                        "8.6  If the user is an entrepreneur, any claim based on faults expires after a statutory period of limitation amounting to twelve (12) months after the Application was made available to the user. The statutory periods of limitation given by law apply for users who are consumers.\n"
                        "9. PRODUCT CLAIMS\n"
                        "Power of 1 Sport LLC and the End-User acknowledge that Power of 1 Sport LLC, and not Apple, is responsible for addressing any claims of the End-User or any third party relating to the licensed Application or the End-User’s possession and/or use of that licensed Application, including, but not limited to:\n"
                        "(i) product liability claims;\n"
                        "(ii) any claim that the licensed Application fails to conform to any applicable legal or regulatory requirement; and\n"
                        "(iii) claims arising under consumer protection, privacy, or similar legislation, including in connection with Your Licensed Application’s use of the HealthKit and HomeKit\n"
                        "10. LEGAL COMPLIANCE\n"
                        "You represent and warrant that You are not located in a country that is subject to a U.S. Government embargo, or that has been designated by the U.S. Government as a terrorist supporting country; and that You are not listed on any U.S. Government list of prohibited or restricted parties.\n"
                        "11. CONTACT INFORMATION\n"
                        "For general inquiries, complaints, questions or claims concerning the licensed Application, please contact:\n"
                        "Power of 1 Sport\n"
                        "5380 W. 34th Street, # 302\n"
                        "Houston, TX 77092\n"
                        "United States\n"
                        "pchesdent@yahoo.com\n"
                        "12. TERMINATION\n"
                        "The license is valid until terminated by Power of 1 Sport LLC or by You. Your rights under this license will terminate automatically and without notice from Power of 1 Sport LLC if You fail to adhere to any term(s) of this license. Upon License termination, You shall stop all use of the Application, and destroy all copies, full or partial, of the Application.\n"
                        "13. THIRD-PARTY TERMS OF AGREEMENTS AND BENEFICIARY\n"
                        "Power of 1 Sport LLC represents and warrants that Power of 1 Sport LLC will comply with applicable third-party terms of agreement when using licensed Application.\n"
                        "In Accordance with Section 9 of the Instructions for Minimum Terms of Developer's End-User License Agreement,Apple and Apple's subsidiaries shall be third-party beneficiaries of this End User License Agreement and - upon Your acceptance of the terms and conditions of this license agreement, Apple will have the right (and will be deemed to have accepted the right) to enforce this End User License Agreement against You as a third-party beneficiary thereof.\n"
                        "14. INTELLECTUAL PROPERTY RIGHTS\n"
                        "Power of 1 Sport LLC and the End-User acknowledge that, in the event of any third-party claim that the licensed Application or the End-User's possession and use of that licensed Application infringes on the third party's intellectual property rights, Power of 1 Sport LLC, and not Apple, will be solely responsible for the investigation, defense, settlement and discharge or any such intellectual property infringement claims.\n"
                        "15. APPLICABLE LAW\n"
                        "This license agreement is governed by the laws of the State of Texas excluding its conflicts of law rules.\n"
                        "16. MISCELLANEOUS\n"
                        "16.1  If any of the terms of this agreement should be or become invalid, the validity of the remaining provisions shall not be affected. Invalid terms will be replaced by valid ones formulated in a way that will achieve the primary purpose.\n"
                        "16.2  Collateral agreements, changes and amendments are only valid if laid down in writing. The preceding clause can only be waived in writing.\n",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        )),
                  ),
                ),
                Container(
                  height: 30,
                  width: 80,
                  child: Positioned(
                    bottom: 10,
                    child: PO1Button("Home", onPress: () {
                      Navigator.pushNamed(context, '/playerName');
                    }),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
