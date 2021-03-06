import 'package:corona_italy/features/infection_report/model/national/national_report_vm.dart';
import 'package:corona_italy/features/infection_report/presentation/widgets/report_grid_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NationalReportScreen extends StatelessWidget {
  final NationalReportVm model;

  const NationalReportScreen({Key key, @required this.model})
      : assert(model != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('national_report')),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: CustomScrollView(
          slivers: [
            SliverGrid.count(
              crossAxisCount: 2,
              childAspectRatio: 2,
              children: [
                ReportGridTile(
                  tr('hospitalized_with_symptoms'),
                  model.hospitalizedWithSymptoms,
                ),
                ReportGridTile(
                  tr('intensive_care'),
                  model.intensiveCare,
                ),
                ReportGridTile(
                  tr('total_hospitalized'),
                  model.totalHospitalized,
                ),
                ReportGridTile(
                  tr('home_isolation'),
                  model.homeIsolation,
                ),
                ReportGridTile(
                  tr('total_positive'),
                  model.totalPositive,
                ),
                ReportGridTile(
                  tr('total_positive_variation'),
                  model.totalPositiveVariation,
                ),
                ReportGridTile(
                  tr('new_positive'),
                  model.newPositive,
                ),
                ReportGridTile(
                  tr('discharged_healed'),
                  model.dischargedHealed,
                ),
                ReportGridTile(
                  tr('deceased'),
                  model.deceased,
                ),
                ReportGridTile(
                  tr('diagnostic_suspicion_cases'),
                  model.diagnosticSuspicionCases,
                ),
                ReportGridTile(
                  tr('screening_cases'),
                  model.screeningCases,
                ),
                ReportGridTile(
                  tr('total_cases'),
                  model.totalCases,
                ),
                ReportGridTile(
                  tr('tampons'),
                  model.tampons,
                ),
                ReportGridTile(
                  tr('tested_cases'),
                  model.testedCases,
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr(
                        'notes',
                      ),
                    ),
                    Text((model.notes?.isNotEmpty ?? false)
                        ? model.notes
                        : tr('no_notes')),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  tr(
                    'last_update',
                    namedArgs: {'lastUpdate': DateFormat().format(model.date)},
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
