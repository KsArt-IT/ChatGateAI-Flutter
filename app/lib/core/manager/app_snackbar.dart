import 'dart:async';

import 'package:chat_gate_ai/core/constants/app_dimens.dart';
import 'package:chat_gate_ai/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

enum SnackBarType {
  success,
  error,
  info,
}

class AppSnackBar extends StatefulWidget {
  const AppSnackBar._({
    required this.message,
    required this.type,
    required this.displayDuration,
    this.onDismiss,
  });

  final SnackBarType type;
  final String message;
  final Duration displayDuration;
  final VoidCallback? onDismiss;

  @override
  State<AppSnackBar> createState() => _AppSnackBarState();

  static void showError(
    BuildContext context, {
    required String message,
    Duration displayDuration = const Duration(seconds: 3),
  }) {
    _show(
      context: context,
      message: message,
      type: SnackBarType.error,
      displayDuration: displayDuration,
    );
  }

  static void showInfo(
    BuildContext context, {
    required String message,
    Duration displayDuration = const Duration(seconds: 3),
  }) {
    _show(
      context: context,
      message: message,
      type: SnackBarType.info,
      displayDuration: displayDuration,
    );
  }

  static void showSuccess(
    BuildContext context, {
    required String message,
    Duration displayDuration = const Duration(seconds: 3),
  }) {
    _show(
      context: context,
      message: message,
      type: SnackBarType.success,
      displayDuration: displayDuration,
    );
  }

  static void _show({
    required BuildContext context,
    required String message,
    required SnackBarType type,
    required Duration displayDuration,
  }) {
    _removeCurrentSnackBar();

    if (!context.mounted) return;

    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => AppSnackBar._(
        message: message,
        type: type,
        displayDuration: displayDuration,
        onDismiss: _removeCurrentSnackBar,
      ),
    );

    _currentSnackBar = overlayEntry;
    overlay.insert(overlayEntry);
  }

  static OverlayEntry? _currentSnackBar;

  static void _removeCurrentSnackBar() {
    _currentSnackBar?.remove();
    _currentSnackBar = null;
  }
}

class _AppSnackBarState extends State<AppSnackBar> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  Timer? _dismissTimer;
  bool _isInitialized = false;
  final startPosition = -200.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      _initAnimation();
      _startDismissTimer();
      _isInitialized = true;
    }
  }

  void _initAnimation() {
    final topPadding = MediaQuery.of(context).padding.top;
    final endPosition = topPadding + 15;
    _slideAnimation =
        Tween<double>(
          begin: startPosition,
          end: endPosition,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOut,
          ),
        );

    _animationController.forward();
  }

  void _startDismissTimer() {
    _dismissTimer = Timer(widget.displayDuration, _dismiss);
  }

  void _dismiss() {
    if (!mounted) return;

    _dismissTimer?.cancel();
    _animationController.reverse().then((_) {
      if (mounted) {
        widget.onDismiss?.call();
      }
    });
  }

  @override
  void dispose() {
    _dismissTimer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _slideAnimation,
      builder: (context, child) {
        return Positioned(
          left: 0,
          right: 0,
          top: _slideAnimation.value,
          child: Material(
            child: GestureDetector(
              onTap: _dismiss,
              behavior: HitTestBehavior.opaque,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 350),
                margin: const EdgeInsets.symmetric(horizontal: AppDimens.inset4x),
                decoration: BoxDecoration(
                  color: _getBackgroundColor(widget.type),
                  borderRadius: BorderRadius.circular(AppDimens.radius3x),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: AppDimens.inset3x,
                  horizontal: AppDimens.inset4x,
                ),
                child: Row(
                  children: [
                    _Icon(type: widget.type),
                    const SizedBox(width: AppDimens.inset2x),
                    Flexible(
                      child: Text(
                        widget.message,
                        style: context.textTheme.bodyMedium?.copyWith(color: Colors.white),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Color _getBackgroundColor(SnackBarType type) {
    return switch (type) {
      SnackBarType.error => context.colorScheme.errorContainer,
      SnackBarType.success => context.colorScheme.secondaryFixed,
      SnackBarType.info => context.colorScheme.tertiaryFixed,
    };
  }
}

class _Icon extends StatelessWidget {
  const _Icon({required this.type});

  final SnackBarType type;

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      SnackBarType.error => const Icon(Icons.error, color: Colors.white, size: AppDimens.inset8x),
      SnackBarType.success => const Icon(
        Icons.check_circle,
        color: Colors.white,
        size: AppDimens.inset8x,
      ),
      SnackBarType.info => const Icon(Icons.info, color: Colors.white, size: AppDimens.inset8x),
    };
  }
}
