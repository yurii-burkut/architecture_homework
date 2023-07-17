import 'package:flutter/material.dart';

class BreedImagesPage extends StatefulWidget {
  const BreedImagesPage({Key? key, required this.images}) : super(key: key);

  final List<String> images;

  @override
  _BreedImagesPageState createState() => _BreedImagesPageState();
}

class _BreedImagesPageState extends State<BreedImagesPage> {
  List<bool> isStarSelectedList = [];

  @override
  void initState() {
    super.initState();
    isStarSelectedList = List.generate(widget.images.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breed Images'),
        backgroundColor: Colors.black87,
      ),
      body: ListView.separated(
        separatorBuilder: (context, _) => const SizedBox(
          height: 24,
          child: Center(
            child: Icon(
              Icons.more_horiz,
              size: 24,
            ),
          ),
        ),
        itemCount: widget.images.length,
        itemBuilder: (context, index) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Image.network(
                widget.images[index],
                errorBuilder: (context, o, _) => const Icon(
                  Icons.image_not_supported_outlined,
                ),
              ),
              Positioned(
                right: 16,
                bottom: 16,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isStarSelectedList[index] = !isStarSelectedList[index];
                      });
                    },
                    child: Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.25),
                      ),
                      child: Icon(
                        Icons.star,
                        color: isStarSelectedList[index]
                            ? Colors.orange
                            : Colors.black.withOpacity(0.75),
                        size: 36,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
