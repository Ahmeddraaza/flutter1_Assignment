import 'package:flutter/material.dart';

import 'package:jobposting_listview/job_list_page.dart';

void main() => runApp(JobListingApp());

class JobListingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Listing',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: JobListPage(),
    );
  }
}
