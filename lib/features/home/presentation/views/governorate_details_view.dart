import 'package:flutter/material.dart';
import 'package:my_visitor/features/home/presentation/search_models/governorate_model.dart';

class GovernorateDetailsView extends StatelessWidget {
  final Governorate governorate;

  const GovernorateDetailsView({super.key, required this.governorate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(governorate.name)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(governorate.description, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 20),
          Text("Activities", style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 10),

          ...governorate.activities.map((activity) {
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(activity.title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(activity.description),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 120,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: activity.images.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 8),
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              activity.images[index],
                              width: 160,
                              height: 120,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                width: 160,
                                height: 120,
                                color: Colors.grey[300],
                                child: const Icon(Icons.broken_image),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
