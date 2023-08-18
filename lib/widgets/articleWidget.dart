import 'package:flutter/material.dart';
import '../data/data.dart';

class ArticleWidget extends StatefulWidget {
  final Article article;
  final double deviceHeight, deviceWidth;

  ArticleWidget({
    Key? key,
    required this.article,
    required this.deviceHeight,
    required this.deviceWidth,
  }) : super(key: key);

  @override
  _ArticleWidgetState createState() {
    return _ArticleWidgetState();
  }
}

class _ArticleWidgetState extends State<ArticleWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.deviceHeight * 0.03),
      child: SizedBox(
        width: widget.deviceWidth,
        height: widget.deviceHeight * 0.35,
        child: Stack(children: [
          Container(
              width: widget.deviceWidth,
              height: widget.deviceHeight * 0.32,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.article.image),
                  ),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black38,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 5))
                  ]),
              child: _articleWidget()),
          Align(
            alignment: Alignment.bottomCenter,
            child: _socialInfoRow(),
          )
        ]),
      ),
    );
  }

  Widget _articleWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
            padding: EdgeInsets.only(
                right: widget.deviceWidth * 0.04,
                left: widget.deviceWidth * 0.04,
                top: widget.deviceWidth * 0.03),
            child: _authorInfoRow()),
        _articleInfoRow(),
      ],
    );
  }

  Widget _authorInfoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: [
            Container(
              height: widget.deviceHeight * 0.06,
              width: widget.deviceHeight * 0.06,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: Colors.white, style: BorderStyle.solid, width: 2),
                image: DecorationImage(
                  image: NetworkImage(widget.article.authorPicture),
                ),
              ),
            ),
            SizedBox(width: widget.deviceWidth * 0.02),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  widget.article.author,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  '3 Hours Ago',
                  style: TextStyle(
                      color: Colors.white54,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Icon(Icons.favorite, color: Colors.red, size: 20),
            SizedBox(height: widget.deviceHeight * 0.01),
            const Icon(Icons.bookmark, color: Colors.white, size: 20),
          ],
        )
      ],
    );
  }

  Widget _articleInfoRow() {
    return Container(
      margin: EdgeInsets.only(top: widget.deviceHeight * 0.04),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.play_arrow, color: Colors.red),
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: widget.deviceWidth * 0.6,
                child: Text(widget.article.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
              Text(widget.article.location.toUpperCase(),
                  style: const TextStyle(color: Colors.white54, fontSize: 12)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: List.generate(
                      5,
                      (index) {
                        double ratingAmount = widget.article.rating - index;
                        Icon starIcon;
                        if (ratingAmount >= 1) {
                          starIcon = const Icon(Icons.star,
                              size: 16, color: Colors.yellow);
                        } else if (ratingAmount == 0.5) {
                          starIcon = const Icon(Icons.star_half,
                              size: 16, color: Colors.yellow);
                        } else {
                          starIcon = const Icon(Icons.star_border,
                              size: 16, color: Colors.yellow);
                        }
                        return starIcon;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text("330 Km",
                      style: TextStyle(color: Colors.white70, fontSize: 13))
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _socialInfoRow() {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: widget.deviceHeight * 0.02,
          horizontal: widget.deviceWidth * 0.05),
      width: widget.deviceWidth * 0.7,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
                color: Colors.black38,
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 5))
          ]),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(children: [
            const Icon(Icons.favorite_border_outlined, color: Colors.red),
            const SizedBox(width: 2),
            Text("${widget.article.likes / 1000}k",
                style: const TextStyle(color: Colors.red))
          ]),
          Row(children: [
            const Icon(Icons.comment, color: Colors.grey),
            const SizedBox(width: 2),
            Text("${widget.article.comments}",
                style: const TextStyle(color: Colors.grey))
          ]),
          Row(children: [
            const Icon(Icons.share, color: Colors.grey),
            const SizedBox(width: 2),
            Text("${widget.article.shares}",
                style: const TextStyle(color: Colors.grey))
          ]),
        ],
      ),
    );
  }
}
