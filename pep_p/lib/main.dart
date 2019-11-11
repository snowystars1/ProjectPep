import 'package:flutter/material.dart';

const String _imageUrlOne =
    'https://static.pexels.com/photos/596940/pexels-photo-596940.jpeg';
const String _imageUrlTwo =
    'https://images.pexels.com/photos/163065/mobile-phone-android-apps-phone-163065.jpeg';
const String _imageUrlThree =
    'https://static.pexels.com/photos/47261/pexels-photo-47261.jpeg';
void main() => runApp(new MaterialApp(
      title: 'Wdiget Switcher',
      home: new LoadImage(),
    ));

class Photo {
  final int index;
  final Text title;
  final String url;
  final Icon icon;
  const Photo({this.index, this.title, this.url, this.icon});
}

const List<Photo> photos = <Photo>[
  const Photo(
    index: 0,
      title: const Text('ImageOne'),
      url: _imageUrlOne,
      icon: const Icon(Icons.looks_one)),
  const Photo(
      index: 1,
      title: const Text('ImageTwo'),
      url: _imageUrlTwo,
      icon: const Icon(Icons.looks_two)),
  const Photo(
      index: 2,
      title: const Text('ImageThree'),
      url: _imageUrlThree,
      icon: const Icon(Icons.looks_3)),
];

class LoadImage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoadImageState();
  }
}

class LoadImageState extends State<LoadImage> {
  Photo _selectedPhotos = photos[0];
  int bottomNavBarIndex = 0;

  void _selectedPhoto(Photo photo) {
    setState(() {
      _selectedPhotos = photo;
      bottomNavBarIndex = photo.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Image Downladed'),
        actions: <Widget>[
          new PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return photos.map((Photo photo) {
                return new PopupMenuItem(
                    value: photo,
                    child: new ListTile(
                      leading: photo.icon,
                      title: photo.title,
                    ));
              }).toList();
            },
            onSelected: _selectedPhoto,
          )
        ],
      ),
      drawer: new Drawer(
          child: new ListView(
        children: <Widget>[
          new ListTile(
            leading: photos[0].icon,
            title: photos[0].title,
            onTap: () {
              _selectedPhoto(photos[0]);
              Navigator.pop(context);
            },
          ),
          new ListTile(
            leading: photos[1].icon,
            title: photos[1].title,
            onTap: () {
              _selectedPhoto(photos[1]);
              Navigator.pop(context);
            },
          ),
          new ListTile(
            leading: photos[2].icon,
            title: photos[2].title,
            onTap: () {
              _selectedPhoto(photos[2]);
              Navigator.pop(context);
            },
          )
        ],
      )),
      body: new ImageUrl(
        imageUrl: _selectedPhotos.url,
      ),
      bottomNavigationBar: new BottomNavigationBar(
          currentIndex: bottomNavBarIndex,
          onTap: (int index) {
            setState(() {

              _selectedPhoto(photos[index]);
            });

          },
          items: [
        new BottomNavigationBarItem(
          icon: photos[0].icon,
          title: photos[0].title,
        ),
        new BottomNavigationBarItem(
          icon: photos[1].icon,
          title: photos[1].title,
        ),
        new BottomNavigationBarItem(
          icon: photos[2].icon,
          title: photos[2].title,
        )
      ]),
    );
  }
}

class ImageUrl extends StatelessWidget {
  final String imageUrl;
  ImageUrl({this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return new Image.network(
      imageUrl,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
