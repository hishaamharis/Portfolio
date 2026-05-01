import 'package:flutter/material.dart';
import 'package:portfolio/services/email_services.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/theme/app_motion.dart';
import 'package:portfolio/theme/app_typography.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _message = TextEditingController();
  bool _sending = false;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _message.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    final name = _name.text.trim();
    final email = _email.text.trim();
    final message = _message.text.trim();

    if (name.isEmpty || email.isEmpty || message.isEmpty) {
      _toast('Please fill all fields');
      return;
    }

    setState(() => _sending = true);
    try {
      await EmailService.sendMessage(name, email, message);
      if (!mounted) return;
      _toast('Message sent.');
      _name.clear();
      _email.clear();
      _message.clear();
    } catch (e) {
      if (!mounted) return;
      _toast('Failed to send: $e');
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  void _toast(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg, style: AppType.body(size: 14, color: AppColors.ink)),
        backgroundColor: AppColors.bone,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('SEND A MESSAGE', style: AppType.eyebrow(color: AppColors.mute)),
        const SizedBox(height: 20),
        _field(label: 'Name', controller: _name),
        const SizedBox(height: 16),
        _field(label: 'Email', controller: _email),
        const SizedBox(height: 16),
        _field(label: 'Message', controller: _message, maxLines: 5),
        const SizedBox(height: 24),
        _SubmitButton(onTap: _send, sending: _sending),
      ],
    );
  }

  Widget _field({
    required String label,
    required TextEditingController controller,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: AppType.body(size: 15, color: AppColors.bone),
      cursorColor: AppColors.accent,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppType.body(size: 14, color: AppColors.mute),
        floatingLabelStyle: AppType.mono(
          size: 11,
          color: AppColors.accent,
          letterSpacing: 1.4,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: AppColors.border, width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: AppColors.accent, width: 1),
        ),
      ),
    );
  }
}

class _SubmitButton extends StatefulWidget {
  final VoidCallback onTap;
  final bool sending;

  const _SubmitButton({required this.onTap, required this.sending});

  @override
  State<_SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<_SubmitButton> {
  bool _hovered = false;
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) {
          setState(() => _pressed = false);
          if (!widget.sending) widget.onTap();
        },
        onTapCancel: () => setState(() => _pressed = false),
        child: AnimatedScale(
          scale: _pressed ? 0.96 : 1.0,
          duration: AppMotion.hover,
          curve: AppMotion.easeOut,
          child: AnimatedContainer(
            duration: AppMotion.hover,
            curve: AppMotion.easeOut,
            padding:
                const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            decoration: BoxDecoration(
              color: _hovered ? AppColors.accent : Colors.transparent,
              border: Border.all(color: AppColors.accent, width: 1),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.sending ? 'SENDING…' : 'SEND',
                  style: AppType.mono(
                    size: 12,
                    letterSpacing: 1.6,
                    weight: FontWeight.w600,
                    color: _hovered ? AppColors.ink : AppColors.accent,
                  ),
                ),
                const SizedBox(width: 12),
                Icon(
                  Icons.arrow_outward,
                  size: 16,
                  color: _hovered ? AppColors.ink : AppColors.accent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
