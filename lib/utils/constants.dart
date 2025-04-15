import 'package:flutter/material.dart';

// App constants
const String APP_NAME = 'Rumah Makan Khas Bengkulu';
const String APP_VERSION = '1.0.0';

// API Endpoints (Dummy)
const String BASE_URL = 'https://api.rumahmakankhaskengkulu.com';
const String API_LOGIN = '$BASE_URL/login';
const String API_REGISTER = '$BASE_URL/register';
const String API_FOODS = '$BASE_URL/foods';
const String API_CATEGORIES = '$BASE_URL/categories';
const String API_ORDERS = '$BASE_URL/orders';

// Shared Preferences Keys
const String PREF_USER_TOKEN = 'user_token';
const String PREF_USER_ID = 'user_id';
const String PREF_USER_NAME = 'user_name';
const String PREF_USER_EMAIL = 'user_email';
const String PREF_IS_DARK_MODE = 'is_dark_mode';

// Routes
const String ROUTE_HOME = '/';
const String ROUTE_MENU = '/menu';
const String ROUTE_DETAIL = '/detail';
const String ROUTE_ORDER = '/order';
const String ROUTE_PROFILE = '/profile';
const String ROUTE_PAGE_ONE = '/page_one';
const String ROUTE_PAGE_TWO = '/page_two';

// Assets
const String ASSET_LOGO = 'assets/images/logo.jpg';
const String ASSET_PENDAP = 'assets/images/pendap.jpeg';
const String ASSET_BAY_TAT = 'assets/images/bay_tat.jpg';
const String ASSET_LEMEA = 'assets/images/lemea.jpeg';
const String ASSET_REBUNG_ASAM = 'assets/images/rebung_asam.jpeg';
const String ASSET_KUE_TAT = 'assets/images/kue_tat.jpeg';

// Colors
const Color PRIMARY_COLOR = Color(0xFF8D4E31);
const Color SECONDARY_COLOR = Color(0xFFFFB74D); // Renamed from ACCENT_COLOR
const Color TEXT_COLOR = Color(0xFF3E2723);
const Color BACKGROUND_COLOR = Colors.white;
const Color ERROR_COLOR = Colors.red;
const Color SUCCESS_COLOR = Colors.green;
