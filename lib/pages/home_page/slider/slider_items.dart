class SliderItem {
  final String title;
  final String imagePath;

  SliderItem({
    required this.title,
    required this.imagePath,
  });
}

List<SliderItem> sliderItems = [
  SliderItem(title: 'Rafting', imagePath: 'lib/image/rafting.jpg'),
  SliderItem(title: 'Paragliding', imagePath: 'lib/image/paragliding.jpeg'),
  SliderItem(title: 'Bungee', imagePath: 'lib/image/bungee.jpg'),
];
