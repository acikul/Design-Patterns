#include <iostream>
#include <assert.h>
#include <stdlib.h>
#include <list>

  struct Point{
    int x; int y;
  };
  enum EType {circle, square, rhomb};

  class Shape {
      public:
        virtual void draw() = 0;
        virtual void move(int x_move, int y_move) = 0;
  };
  class Circle : public Shape {
      private:
        EType type_;
        double radius_;
        Point center_;
      public:
        Circle(EType type, double radius, int x_, int y_) {
            type_ = type;
            radius_ = radius;
            center_.x = x_;
            center_.y = y_;
        }
        virtual void draw() {
            std::cerr <<"in drawCircle\n";
        }
        virtual void move(int x_move, int y_move) {
            center_.x += x_move;
            center_.y += y_move;
            std::cerr << "nove koordinate centra kruga: x = " << center_.x << " y = " << center_.y << std::endl;
        }
  };

  class Square : public Shape {
      private:
        EType type_;
        double side_;
        Point center_;
      public:
        Square(EType type, double side, int x_, int y_) {
            type_ = type;
            side_ = side;
            center_.x = x_;
            center_.y = y_;
        }
        virtual void draw() {
            std::cerr <<"in drawSquare\n";
        }
        virtual void move(int x_move, int y_move) {
            center_.x += x_move;
            center_.y += y_move;
            std::cerr << "nove koordinate centra kvadrata: x = " << center_.x << " y = " << center_.y << std::endl;
        }
  };

class Rhomb : public Shape {
      private:
        EType type_;
        double side_;
        Point center_;
      public:
        Rhomb(EType type, double side, int x_, int y_) {
            type_ = type;
            side_ = side;
            center_.x = x_;
            center_.y = y_;
        }
        virtual void draw() {
            std::cerr <<"in drawRhomb\n";
        }
        virtual void move(int x_move, int y_move) {
            center_.x += x_move;
            center_.y += y_move;
            std::cerr << "nove koordinate centra romba: x = " << center_.x << " y = " << center_.y << std::endl;
        }
  };
  
  void drawShapes(const std::list<Shape*>& fig){ 
      std::list<Shape*>::const_iterator it;
      for (it=fig.begin(); it!=fig.end(); ++it){
      (*it)->draw();
      }
    }
  void moveShapes(const std::list<Shape*>& fig, int x_move, int y_move){
      std::list<Shape*>::const_iterator it;
      for (it=fig.begin(); it!=fig.end(); ++it) {
          (*it)->move(x_move, y_move);
      }
  }
  
  int main() {
    std::list<Shape*> shapes;

    Shape *circle1 = new Circle(circle, 1, 1, 1);
    Shape *square1 = new Square(square, 3, 3, 3);
    Shape *circle2 = new Circle(circle, 5, 5, 5);
    Shape *square2 = new Square(square, 10, 10, 10);
    Shape *rhomb1 = new Rhomb(rhomb, 7, 7, 7);

    shapes.push_back(circle1);
    shapes.push_back(square1);
    shapes.push_back(circle2);
    shapes.push_back(square2);
    shapes.push_back(rhomb1);

    drawShapes(shapes);
    std::cerr <<"\n";
    moveShapes(shapes, -1, 2);
  }

  // drawShapes i moveShapes apstrahiraju konkretne objekte
  // polimorfni poziv preko zajedničkog sučelja
  // ne mora unaprijed biti poznata duljina liste objekata shapes