import 'package:flutter/material.dart';

class JobDetailsPage extends StatelessWidget {
  final Map job;

  const JobDetailsPage({required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(job['title']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), //padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .start, //vertical array to display data vertically
          children: [
            Center(
              child: Image.network(
                job['company']['logo'],
                width: 100,
                height: 100,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error,
                      color: Colors.red); // Handle image error
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              job['title'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Company: ${job['company']['name']}',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Location: ${job['location']['name_en']}',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Type: ${job['type']['name_en']}',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Posted: ${job['created_date']}',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              'Description:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              job['icp_answers']['job-role'][0]['description_en'] ??
                  'No description available',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
