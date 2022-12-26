import 'package:flutter/material.dart';
import 'package:turismo/search/search_delegate.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            hintText: "Iniciar búsqueda",
            hintStyle:
                TextStyle(color: Color.fromARGB(255, 255, 255, 255).withOpacity(1), fontSize: 16),
            filled: true,
            fillColor: Color.fromARGB(255, 242, 241, 241).withOpacity(0.32),
            prefixIcon: IconButton(
             icon: Icon(Icons.search),
              color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.85), 
              onPressed: () {  
                    showSearch(context: context, delegate: productSearchDelegate());
                  },
            ),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide.none),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide.none),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide.none), 
          ),
        ),
        SizedBox(height: 20,),
        TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            hintText: "búsqueda restaurant",
            hintStyle:
                TextStyle(color: Color.fromARGB(255, 255, 255, 255).withOpacity(1), fontSize: 16),
            filled: true,
            fillColor:  Color.fromARGB(255, 242, 241, 241).withOpacity(0.32),
            prefixIcon: IconButton(
             icon: Icon(Icons.search),
              color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.85), 
              onPressed: () {  
                    showSearch(context: context, delegate: RestaurantSearchDelegate());
                  },
            ),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide.none),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide.none),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide.none), 
          ),
        ),
      ],
    );
  }
}
