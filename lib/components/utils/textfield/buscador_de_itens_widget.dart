// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BuscadoDeItensWidget extends StatefulWidget {
  BuscadoDeItensWidget(
      {super.key,
      required TextEditingController this.searchController,
      required String this.dadosPesquisados});

  TextEditingController searchController;
  String dadosPesquisados;

  @override
  State<BuscadoDeItensWidget> createState() => _BuscadoDeItensWidgetState();
}

class _BuscadoDeItensWidgetState extends State<BuscadoDeItensWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 5, 5, 5).withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        controller: widget.searchController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.red,
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {},
          ),
          hintText: 'Pesquise algo',
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {
          setState(() {
            // widget.dadosPesquisados = value;
          });
        },
      ),
    );
  }
}
