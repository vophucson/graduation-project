import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewUI extends StatelessWidget {
  final String? image, name, date, comment;
  final double? rating;
  final bool? isLess;
  const ReviewUI({
    this.image,
    this.name,
    this.date,
    this.comment,
    this.rating,
    this.isLess,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 2.0,
        bottom: 2.0,
        left: 16.0,
        right: 0.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              image == ''
                  ? Container(
                      height: 45.0,
                      width: 45.0,
                      margin: EdgeInsets.only(right: 16.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/no_avatar.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(44.0),
                      ),
                    )
                  : Container(
                      height: 45.0,
                      width: 45.0,
                      margin: EdgeInsets.only(right: 16.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(image!),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(44.0),
                      ),
                    ),
              Expanded(
                child: Text(
                  name!,
                  style: GoogleFonts.spartan(
                    textStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -1,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              RatingBarIndicator(
                rating: rating!,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                itemCount: 5,
                itemSize: 28.0,
              ),
              SizedBox(width: 16.0),
              Text(
                date!,
                style: GoogleFonts.spartan(
                  textStyle: TextStyle(
                    fontSize: 16,
                    //    color: Colors.redAccent,
                    letterSpacing: -1,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          GestureDetector(
            child: isLess!
                ? Text(
                    comment!,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xFF808080),
                    ),
                  )
                : Text(
                    comment!,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.spartan(
                      textStyle: TextStyle(
                        fontSize: 17,
                        color: Colors.black87,
                        letterSpacing: -1,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
