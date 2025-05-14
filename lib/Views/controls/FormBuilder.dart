import 'package:flutter/widgets.dart';

class FormBuilder extends StatelessWidget {
  const FormBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              // FormFieldBuilder(),
              // FormFieldBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
