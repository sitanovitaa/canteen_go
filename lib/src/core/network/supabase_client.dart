// lib/src/core/network/supabase_client.dart
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAppClient {
  SupabaseAppClient._();

  static SupabaseClient get instance => Supabase.instance.client;
}
