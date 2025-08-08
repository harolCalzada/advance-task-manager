import 'package:advance_task_manager/presentation/state/countries/country_detail_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountryDetailPage extends ConsumerWidget {
  const CountryDetailPage({super.key, required this.code});

  final String code;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(countryDetailNotifierProvider(code));

    return Scaffold(
      appBar: AppBar(title: Text('Country: $code')),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (msg) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Error loading country', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(msg, textAlign: TextAlign.center),
                const SizedBox(height: 12),
                FilledButton.icon(
                  onPressed: () => ref.read(countryDetailNotifierProvider(code).notifier).load(code),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
        data: (detail) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Center(child: Text(detail.emoji, style: const TextStyle(fontSize: 64))),
            const SizedBox(height: 12),
            Center(
              child: Text(
                '${detail.name} (${detail.code})',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            _InfoTile(icon: Icons.public, label: 'Continent', value: detail.continentName),
            _InfoTile(icon: Icons.location_city, label: 'Capital', value: detail.capital ?? '—'),
            _InfoTile(icon: Icons.payments_outlined, label: 'Currency', value: detail.currency ?? '—'),
            const SizedBox(height: 12),
            Text('Languages', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            if (detail.languages.isEmpty)
              const Text('No official languages listed')
            else
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: detail.languages.map((l) => Chip(label: Text(l))).toList(growable: false),
              ),
          ],
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({required this.icon, required this.label, required this.value});

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}
