import 'package:core/color/font_color.dart';
import 'package:flutter/material.dart';

import 'app_action_button.dart';

class OrderBookLevel {
  const OrderBookLevel({
    required this.bidQty,
    required this.bidPrice,
    required this.askPrice,
    required this.askQty,
  });

  final String bidQty;
  final String bidPrice;
  final String askPrice;
  final String askQty;
}

class TradeActionWidget extends StatelessWidget {
  const TradeActionWidget({
    super.key,
    required this.levels,
    required this.onBuy,
    required this.onSend,
    this.highlightedIndex = 1,
    this.bidLabel = 'Bid',
    this.askLabel = 'Ask',
    this.buyLabel = 'BUY',
    this.sendLabel = 'SEND',
  });

  final List<OrderBookLevel> levels;
  final VoidCallback onBuy;
  final VoidCallback onSend;
  final int? highlightedIndex;
  final String bidLabel;
  final String askLabel;
  final String buyLabel;
  final String sendLabel;

  static const _gap = 8.0;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewPadding.bottom;
    return Container(
      padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottomInset),
      decoration: BoxDecoration(
        color: FontColor.surface(),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              children: [
                Expanded(child: _HeaderText(bidLabel)),
                const SizedBox(width: _gap),
                Expanded(child: _HeaderText(askLabel)),
              ],
            ),
          ),
          const SizedBox(height: 12),
          for (int i = 0; i < levels.length; i++) ...[
            _LevelRow(
              level: levels[i],
              highlighted: i == highlightedIndex,
              rowColor: FontColor.surfaceInset(),
              bidColor: FontColor.priceUp(),
              askColor: FontColor.priceDown(),
              qtyColor: FontColor.sheetHandle(),
              gap: _gap,
            ),
            if (i != levels.length - 1) const SizedBox(height: 14),
          ],
          const SizedBox(height: 28),
          Row(
            children: [
              Expanded(
                child: AppActionButton(
                  label: buyLabel,
                  onTap: onBuy,
                  backgroundColor: FontColor.priceUp(),
                  borderRadius: 100,
                  labelStyle: _buttonStyle,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: AppActionButton(
                  label: sendLabel,
                  onTap: onSend,
                  backgroundColor: FontColor.primary(),
                  borderRadius: 100,
                  labelStyle: _buttonStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static const _buttonStyle = TextStyle(
    color: Colors.white,
    fontSize: 13,
    fontWeight: FontWeight.w700,
    letterSpacing: 1,
  );
}

class _HeaderText extends StatelessWidget {
  const _HeaderText(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 14,
      letterSpacing: 0.5,
    ),
  );
}

class _LevelRow extends StatelessWidget {
  const _LevelRow({
    required this.level,
    required this.highlighted,
    required this.rowColor,
    required this.bidColor,
    required this.askColor,
    required this.qtyColor,
    required this.gap,
  });

  final OrderBookLevel level;
  final bool highlighted;
  final Color rowColor;
  final Color bidColor;
  final Color askColor;
  final Color qtyColor;
  final double gap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: highlighted ? rowColor : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          // Bid: số lượng (trái) - giá (phải)
          Expanded(
            child: Row(
              children: [
                _Qty(level.bidQty, qtyColor),
                const Spacer(),
                _PriceChip(
                  text: level.bidPrice,
                  color: bidColor,
                  background: rowColor,
                ),
              ],
            ),
          ),
          SizedBox(width: gap),
          Expanded(
            child: Row(
              children: [
                _PriceChip(
                  text: level.askPrice,
                  color: askColor,
                  background: rowColor,
                ),
                const Spacer(),
                _Qty(level.askQty, qtyColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Qty extends StatelessWidget {
  const _Qty(this.text, this.color);
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) =>
      Text(text, style: TextStyle(color: color, fontSize: 13));
}

class _PriceChip extends StatelessWidget {
  const _PriceChip({
    required this.text,
    required this.color,
    required this.background,
  });

  final String text;
  final Color color;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text, style: TextStyle(color: color, fontSize: 13)),
    );
  }
}

Future<void> showTradeActionSheet(
    BuildContext context, {
      required List<OrderBookLevel> levels,
      required VoidCallback onBuy,
      required VoidCallback onSend,
    }) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) => TradeActionWidget(
      levels: levels,
      onBuy: onBuy,
      onSend: onSend,
    ),
  );
}