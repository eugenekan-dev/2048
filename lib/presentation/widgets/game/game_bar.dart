part of 'game.dart';

class GameBar extends StatelessWidget {
  const GameBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //TODO: change sizing
      margin: const EdgeInsets.only(top: 64),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InformationTile(
            size: MediaQuery.of(context).size.width / 4,
            body: '2048',
            color: AppColors.color2048,
          ),
          Row(
            children: [
              Column(
                children: [
                  const InformationTile(
                    body: '0',
                    color: AppColors.scoreColor,
                    size: 84,
                    title: 'SCORE',
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GameBarButton(
                    width: 84,
                    onPressed: () {},
                    text: 'Menu',
                  ),
                ],
              ),
              const SizedBox(
                width: 12.0,
              ),
              Column(
                children: [
                  const InformationTile(
                    body: '0',
                    color: AppColors.scoreColor,
                    size: 84,
                    title: 'Best',
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GameBarButton(
                    width: 84,
                    onPressed: () {},
                    text: 'Leaderboard',
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
