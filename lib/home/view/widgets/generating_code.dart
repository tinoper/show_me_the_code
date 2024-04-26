import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class GeneratingCode extends StatefulWidget {
  const GeneratingCode({super.key});

  @override
  State<GeneratingCode> createState() => _GeneratingCodeState();
}

class _GeneratingCodeState extends State<GeneratingCode> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
  );

  @override
  void initState() {
    super.initState();

    _stopWatchTimer.onStartTimer();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Generating code',
            style: TextStyle(
              fontSize: size.width * 0.03,
              color: theme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 0.02),
          StreamBuilder<int>(
            stream: _stopWatchTimer.rawTime,
            initialData: _stopWatchTimer.rawTime.value,
            builder: (context, snap) {
              final value = snap.data!;
              final displayTime = StopWatchTimer.getDisplayTime(
                value,
                hours: false,
                minute: false,
              );
              return Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    width: size.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size.width * 0.05),
                      color: theme.primaryColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            displayTime,
                            style: TextStyle(
                              fontSize: size.width * 0.05,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: size.width * 0.005,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
    _stopWatchTimer.onStopTimer();
  }
}
