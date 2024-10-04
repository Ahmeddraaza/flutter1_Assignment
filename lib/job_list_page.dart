import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'job_card.dart'; // Import the JobCard widget

class JobListPage extends StatefulWidget {
  @override
  _JobListPageState createState() => _JobListPageState();
}

class _JobListPageState extends State<JobListPage> {
  List jobs = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchJobs();
  }

  Future<void> fetchJobs() async {
    final response = await http
        .get(Uri.parse('https://mpa0771a40ef48fcdfb7.free.beeceptor.com/jobs'));

    if (response.statusCode == 200) {
      setState(() {
        jobs = json.decode(response.body)['data'];
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load jobs');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Job Listings')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: jobs.length,
              itemBuilder: (context, index) {
                final job = jobs[index]['job'];
                return JobCard(job: job); // Use the JobCard widget
              },
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Jobs'),
        ],
      ),
    );
  }
}
