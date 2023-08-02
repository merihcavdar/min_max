import 'package:flutter/material.dart';
import 'randomizer_page.dart';

class RangeSelectorPage extends StatefulWidget {
  const RangeSelectorPage({super.key});

  @override
  State<RangeSelectorPage> createState() => _RangeSelectorPageState();
}

class _RangeSelectorPageState extends State<RangeSelectorPage> {
  final formKey = GlobalKey<FormState>();
  int _min = 0;
  int _max = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Number in Range'),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RangeSelectorTextFormField(
                labelText: 'Minimum',
                intValueSetter: (value) => _min = value,
              ),
              const SizedBox(
                height: 12.0,
              ),
              RangeSelectorTextFormField(
                labelText: 'Maximum',
                intValueSetter: (value) => _max = value,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
          }
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => RandomizerPage(min: _min, max: _max)));
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}

class RangeSelectorTextFormField extends StatelessWidget {
  const RangeSelectorTextFormField({
    super.key,
    required this.labelText,
    required this.intValueSetter,
  });
  final String labelText;
  final void Function(int value) intValueSetter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
          border: OutlineInputBorder(), labelText: 'Minimum'),
      keyboardType:
          const TextInputType.numberWithOptions(decimal: false, signed: true),
      validator: (value) {
        if (value == null || int.tryParse(value) == null) {
          return 'must be an integer';
        } else {}
      },
      onSaved: (newValue) => intValueSetter(
        int.parse(newValue ?? ''),
      ),
    );
  }
}
