import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:neucalcu/models/record.dart';
import 'package:neucalcu/themes/colors.dart';
import 'package:neucalcu/themes/dimensions.dart';
import 'package:neucalcu/widgets/custom_icon_button.dart';
import 'package:neucalcu/widgets/record_container.dart';

class RecordsPage extends StatelessWidget {
  static const String id = '/records';
  static const double _padding = 16.0;

  final recordBox = Hive.box<Record>(boxRecord);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baseColor,
      body: Column(
        children: <Widget>[
          SizedBox(height: 25.0),
          Padding(
            padding: const EdgeInsets.only(
              left: _padding,
              top: _padding,
              right: _padding
            ),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  height: 40.0,
                  width: double.infinity,
                ),
                Positioned(
                  left: 0,
                  child: CustomIconButton(
                    icon: Icons.arrow_back_ios,
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Text(
                  'Record History',
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: sizeSubHead2,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: CustomIconButton(
                    icon: Icons.delete,
                    onPressed: () {
                      recordBox..clear();
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.0),
          _buildListView(),
        ],
      ),
    );
  }

  _buildListView() {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          left: _padding,
          right: _padding,
          bottom: _padding
        ),
        itemCount: recordBox.length,
        itemBuilder: (context, index) {
          final Record record = recordBox.get(index);
          return RecordContainer(record: record);
        },
      ),
    );
  }
}
