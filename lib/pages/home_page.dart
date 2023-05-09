import 'package:expense_tracker_fiap/pages/categorias_page.dart';
import 'package:expense_tracker_fiap/pages/contas_page.dart';
import 'package:expense_tracker_fiap/pages/dashboard_page.dart';
import 'package:expense_tracker_fiap/pages/transacoes_page.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

int _selectedIndex = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: _selectedIndex,
      children: [
        DashBoardPage(),
        TransacoesPage(),
        ContasPage(),
        CategoriasPage(),
      ],
    );
  }

  Widget getBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      // ignore: prefer_const_literals_to_create_immutables
      items: [
        BottomNavigationBarItem(
          icon: Icon(Ionicons.bar_chart_outline),
          label: "Dashboard",
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.swap_horizontal_outline),
          label: "Transações",
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.wallet_outline),
          label: "Contas",
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.list_outline),
          label: "Categorias",
        ),
      ],
      type: BottomNavigationBarType.fixed,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
