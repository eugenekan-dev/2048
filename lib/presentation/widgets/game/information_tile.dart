part of 'game.dart';

class InformationTile extends StatelessWidget {
  const InformationTile({
    super.key,
    required this.size,
    this.title,
    required this.body,
    required this.color,
  });

  final double size;
  final String? title;
  final String body;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        4.0,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: AppColors.borderRadius,
      ),
      width: size,
      height: size,
      child: Center(
        child: Column(
          children: [
            title != null
                ? Expanded(
                    child: Center(
                      child: Text(
                        '$title',
                        style: TextStyle(
                          color: AppColors.textColorWhite.withOpacity(0.8),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                : const Spacer(),
            Center(
              child: Text(
                body,
                style: TextStyle(
                  color: AppColors.textColorWhite,
                  fontSize: title != null ? 22 : 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
