import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Automation Lab',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0066FF),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFAFAFA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF000000),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const MyHomePage(title: 'Automation Lab'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _displayText = 'Automation Lab';
  final TextEditingController _textController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) _counter--;
    });
  }

  void _updateText() {
    setState(() {
      _displayText = _textController.text.isEmpty
          ? 'Automation Lab'
          : _textController.text;
    });
  }

  void _resetAll() {
    setState(() {
      _counter = 0;
      _displayText = 'Automation Lab';
      _textController.clear();
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20),
                // Header with black and blue gradient
                Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF000000),
                        Color(0xFF0066FF),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Text(
                    _displayText,
                    key: const Key('displayText'),
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 50),
                // Counter section - symmetrical design
                Container(
                  padding: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xFF000000),
                      width: 3,
                    ),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'COUNTER',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF000000),
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '$_counter',
                        key: const Key('counterValue'),
                        style: const TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF0066FF),
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                // Symmetrical button layout
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSymmetricalButton(
                      key: const Key('decrementButton'),
                      label: '−',
                      onPressed: _decrementCounter,
                      isActive: false,
                    ),
                    const SizedBox(width: 24),
                    _buildSymmetricalButton(
                      key: const Key('incrementButton'),
                      label: '+',
                      onPressed: _incrementCounter,
                      isActive: true,
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                // Text input section with black border
                TextField(
                  key: const Key('textInput'),
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: 'Enter message',
                    hintStyle: const TextStyle(
                      color: Color(0xFFCCCCCC),
                      fontSize: 14,
                      letterSpacing: 0.5,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        color: Color(0xFF000000),
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        color: Color(0xFF000000),
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        color: Color(0xFF0066FF),
                        width: 3,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                  style: const TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 14,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    key: const Key('updateButton'),
                    onPressed: _updateText,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0066FF),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'UPDATE MESSAGE',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Reset button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    key: const Key('resetButton'),
                    onPressed: _resetAll,
                    icon: const Icon(Icons.refresh, size: 18),
                    label: const Text('RESET ALL'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF000000),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      elevation: 0,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                // Footer
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Color(0xFF000000),
                        width: 2,
                      ),
                    ),
                  ),
                  child: const Text(
                    'AUTOMATION TESTING LAB',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF000000),
                      letterSpacing: 2,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSymmetricalButton({
    required Key key,
    required String label,
    required VoidCallback onPressed,
    required bool isActive,
  }) {
    return SizedBox(
      width: 80,
      height: 80,
      child: ElevatedButton(
        key: key,
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive ? const Color(0xFF0066FF) : Colors.white,
          foregroundColor: isActive ? Colors.white : const Color(0xFF0066FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            side: const BorderSide(
              color: Color(0xFF000000),
              width: 3,
            ),
          ),
          elevation: 0,
          padding: EdgeInsets.zero,
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}

