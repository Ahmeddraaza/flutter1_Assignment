import 'package:flutter/material.dart';
import 'job_details_page.dart'; // Import the JobDetailsPage

class JobCard extends StatelessWidget {
  final Map job;

  const JobCard({required this.job});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: Image.network(
          job['company']['logo'],
          width: 50,
          height: 50,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.error,
                color: Colors.red); // Handle image error
          },
        ),
        title: Text(job['title']),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Company: ${job['company']['name']}'),
            Text('Location: ${job['location']['name_en']}'),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          // Navigate to JobDetailsPage when the card is tapped
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => JobDetailsPage(job: job),
            ),
          );
        },
      ),
    );
  }
}
