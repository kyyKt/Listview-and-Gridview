import 'package:flutter/material.dart';
import 'package:kkasen/models/wisata.dart';
import 'package:kkasen/screen/Homepage.dart';
import 'package:kkasen/screen/detail.dart';

class TampilanList extends StatelessWidget {
  const TampilanList({super.key});

  @override
  Widget build(BuildContext context) {
    var wisata = Wisata();
    return Scaffold(
      body: ListView.builder(
        itemCount: wisata.data.length,
        itemBuilder: (context, index) {
          var item = wisata.data[index];
          return Card(
            color: Colors.deepPurpleAccent,
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            elevation: 2,
            child: ListTile(
              leading: Hero(
                tag: item['nama']!,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    item['gambar']!,
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 50,
                        width: 50,
                        color: Colors.grey[300],
                        child: Icon(Icons.image_not_supported),
                      );
                    },
                  ),
                ),
              ),
              title: Text(
                item['nama']!,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                item['lokasi']!,
                style: TextStyle(color: Colors.white70),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 16,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(wisata: item),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
