
/*
 * GLUT Shapes Demo
 *
 * Written by Nigel Stewart November 2003
 *
 * This program is test harness for the sphere, cone
 * and torus shapes in GLUT.
 *
 * Spinning wireframe and smooth shaded shapes are
 * displayed until the ESC or q key is pressed.  The
 * number of geometry stacks and slices can be adjusted
 * using the + and - keys.
 */

#ifdef __APPLE__
#include <GLUT/glut.h>
#else
#include <GL/glut.h>
#endif

#include <stdlib.h>
#include "biblioteka.h"
#include <iostream>

#define LICZBA_OB_TEXTUR 4
GLuint obiektyTextur [LICZBA_OB_TEXTUR];
char *plikiTextur[LICZBA_OB_TEXTUR] = {"C:/Users/User/MyRepositoriesGH/Studies/ComputerGraphics/Projekt/Wood.tga","C:/Users/User/MyRepositoriesGH/Studies/ComputerGraphics/Projekt/Zima.tga", "C:/Users/User/MyRepositoriesGH/Studies/ComputerGraphics/Projekt/Ziemia.tga", "C:/Users/User/MyRepositoriesGH/Studies/ComputerGraphics/Projekt/Ocean.tga"};

static int slices = 16;
static int stacks = 16;

float c=1.0f, b =0.1f;

//ZMIENNE GLOBALNE DLA KAMERY
GLfloat PI = 3.14;
GLfloat alfa = -PI / 2;
GLfloat skok_point = 300.0f; ///odleglosc punktu obserwowania
GLfloat skok_eye = 10.0f; ///do pozycji oka
GLfloat eyex = 0; ///wspolrzedne pozycji oka
GLfloat eyey = 0;
GLfloat eyez = -1;
GLfloat pointx = skok_point * cos (alfa); ///wspolrzedne punktu, w ktory sie patrzymy
GLfloat pointy = 0.0;
GLfloat pointz = skok_point * sin (alfa);
//KONIEC ZMIENNYCH GLOBALNYCH DLA KAMERY

//ZMIENNE DLA RZUTOWANIA
enum
{
    EXIT,
    FULL_WINDOW,
    ASPECT_1_1,
    ORTO,
    FRUST,
    PERSP
};
// ustawienie wartości startowych
GLint skala=FULL_WINDOW;
GLint rzut=ORTO;
GLdouble fovy = 90;
// ustawienie parametrów zakresu rzutni
GLdouble aspect = 1;
GLfloat zakres = 10.0f;
GLfloat blisko = 1.0f;
GLfloat daleko = 10.0f;
//KONIEC ZMIENNYCH RZUTOWANIA

//Swiatlo ogolne
// definiowanie wartości parametrów światła ogólnego
GLfloat fPozycja_swiatla[4] = {100.0f, 100.0f, 50.0f, 1.0f};
GLfloat fSlabe_swiatlo[] = {0.25f, 0.25f, 0.25f, 1.0f};
GLfloat fMocne_swiatlo[] = {1.0, 1.0, 1.0, 1.0};

// definiowanie wartości parametrów światła kierunkowego
GLfloat fPozycja_swiatlak[4] = {100.0f, 100.0f, 0.0f, 1.0f};
GLfloat fSlabe_swiatlok[] = {0.25f, 0.25f, 0.25f, 1.0f};
GLfloat fMocne_swiatlok[] = {1.0f, 1.0f, 1.0f, 1.0f};
GLfloat fPozycja_reflektora[4] = {0.0f, 10.0f, -2.5f, 1.0f};
GLfloat fKierunek_reflektora[4] = {0.0f, -2.0f, 0.0f, 1.0f};


/* GLUT callback Handlers */

static void resize(int width, int height)
{
    const float ar = (float) width / (float) height;

    glViewport(0, 0, width, height);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    //glFrustum(-ar, ar, -1.0, 1.0, 2.0, 100.0);

///*
    if (rzut==ORTO)
    {
        if (skala==ASPECT_1_1)
        {
            if (width < height && width > 0)
                glOrtho (-zakres,zakres,-zakres*height/width,zakres*height/width,-zakres,zakres);
            else if (width >= height && height > 0)
                glOrtho (-zakres*width/height,zakres*width/height,-zakres,zakres,-zakres,zakres);
        }
        else
            glOrtho (-zakres,zakres,-zakres,zakres,-zakres,zakres);
    }
    if (rzut==FRUST)
    {
        if (skala==ASPECT_1_1)
        {
            if (width < height && width > 0)
                glFrustum (-zakres,zakres,-zakres*height/width,zakres*height/width,blisko,daleko);
            else if (width >= height && height > 0)
                glFrustum (-zakres*width/height,zakres*width/height,-zakres,zakres,blisko,daleko);
        }
        else
            glFrustum (-zakres,zakres,-zakres,zakres,blisko,daleko);
    }
    if (rzut==PERSP)
    {
        if (height > 0)
            aspect = width/(GLdouble)height;
        gluPerspective (fovy,aspect,blisko,daleko);
    }

//*/

    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity() ;
}

static void display(void)
{
    //Kamera
    glLoadIdentity();
    gluLookAt (eyex, eyey, eyez, pointx, pointy, pointz, 0.0, 1.0, 0.0);

    const double t = glutGet(GLUT_ELAPSED_TIME) / 1000.0;
    const double a = t*90.0;

    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glColor3d(1,1,1);

    glPushMatrix();
    glTranslated(0,0,0);//-30
    //glRotated(20,0,1,0);
    glRotated(a,0,1,0); // obrot
    glTranslated(5.0f, 0.0f, 10.0f); // przesuniecie

    ///glutSolidSphere(1,slices,stacks);
    //PIERWSZA SCIANA **********************************************************************************************************
    glBindTexture (GL_TEXTURE_2D, obiektyTextur[0]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(-6.0,4.0, 0);
    glTexCoord2f(0,0);
    glVertex3f(-6.0,-4.0,0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(-4.0, -4.0, 0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(-4.0,4.0, 0);
    glEnd();

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[0]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(-4.0,-2.0, 0);
    glTexCoord2f(0,0);
    glVertex3f(-4.0,-4.0,0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(4.0, -4.0, 0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(4.0,-2.0, 0);
    glEnd();

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[0]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(-4.0,4.0, 0);
    glTexCoord2f(0,0);
    glVertex3f(-4.0,1.0,0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(4.0, 1.0, 0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(4.0,4.0, 0);
    glEnd();

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[0]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(4.0,4.0, 0);
    glTexCoord2f(0,0);
    glVertex3f(4.0,-4.0,0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(6.0, -4.0, 0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(6.0,4.0, 0);
    glEnd();

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[0]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(-2.0,1.0, 0);
    glTexCoord2f(0,0);
    glVertex3f(-2.0,-2.0,0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(2.0, -2.0, 0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(2.0,1.0, 0);
    glEnd();
    //FRAMUGI PIERWSZEGO OKNA **********************************************************************************************

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[2]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(-2.0,1.0, 0);
    glTexCoord2f(0,0);
    glVertex3f(-2.0,-2.0,0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(-2.0, -2.0, -1.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(-2.0,1.0, -1.0);
    glEnd();

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[2]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(-4.0,1.0, 0);
    glTexCoord2f(0,0);
    glVertex3f(-4.0,-2.0,0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(-4.0, -2.0, -1.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(-4.0,1.0, -1.0);
    glEnd();

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[2]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(-4.0,1.0, 0);
    glTexCoord2f(0,0);
    glVertex3f(-4.0,1.0,-1.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(-2.0, 1.0, -1.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(-2.0,1.0, 0);
    glEnd();

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[2]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(-4.0,-2.0, 0);
    glTexCoord2f(0,0);
    glVertex3f(-4.0,-2.0,-1.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(-2.0, -2.0, -1.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(-2.0,-2.0, 0);
    glEnd();
    //PIERWSZE OKNo  ********************************************************************************************************
    glBindTexture (GL_TEXTURE_2D, obiektyTextur[3]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(-4.0, 1.0, -1.0);
    glTexCoord2f(0,0);
    glVertex3f(-4.0,-2.0,-1.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(-2.0, -2.0, -1.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(-2.0,1.0, -1.0);
    glEnd();

    //FRAMUGI DRUGIEGO OKNA **********************************************************************************************

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[2]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(2.0,1.0, 0);
    glTexCoord2f(0,0);
    glVertex3f(2.0,-2.0,0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(2.0, -2.0, -1.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(2.0,1.0, -1.0);
    glEnd();


    glBindTexture (GL_TEXTURE_2D, obiektyTextur[2]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(4.0,1.0, 0);
    glTexCoord2f(0,0);
    glVertex3f(4.0,-2.0,0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(4.0, -2.0, -1.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(4.0,1.0, -1.0);
    glEnd();


    glBindTexture (GL_TEXTURE_2D, obiektyTextur[2]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(2.0,1.0, 0);
    glTexCoord2f(0,0);
    glVertex3f(2.0,1.0,-1.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(4.0, 1.0, -1.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(4.0,1.0, 0);
    glEnd();

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[2]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(2.0,-2.0, 0);
    glTexCoord2f(0,0);
    glVertex3f(2.0,-2.0,-1.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(4.0, -2.0, -1.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(4.0,-2.0, 0);
    glEnd();
    //DRUGIE OKNo  ********************************************************************************************************
    glBindTexture (GL_TEXTURE_2D, obiektyTextur[3]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(2.0, 1.0, -1.0);
    glTexCoord2f(0,0);
    glVertex3f(2.0,-2.0,-1.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(4.0, -2.0, -1.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(4.0,1.0, -1.0);
    glEnd();

    //SCIANA PRAWA **********************************************************************************************************

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[0]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(6.0, 4.0, 0);
    glTexCoord2f(0,0);
    glVertex3f(6.0,-4.0,0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(6.0, -4.0, -2.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(6.0,4.0, -2.0);
    glEnd();

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[0]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(6.0, -2.0, -2.0);
    glTexCoord2f(0,0);
    glVertex3f(6.0,-4.0,-2.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(6.0, -4.0, -4.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(6.0,-2.0, -4.0);
    glEnd();

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[0]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(6.0, 4.0, -2.0);
    glTexCoord2f(0,0);
    glVertex3f(6.0,1.0,-2.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(6.0, 1.0, -4.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(6.0,4.0, -4.0);
    glEnd();

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[0]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(6.0, 4.0, -4.0);
    glTexCoord2f(0,0);
    glVertex3f(6.0,-4.0,-4.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(6.0, -4.0, -6.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(6.0,4.0, -6.0);
    glEnd();

    //FRAMUGI PIERWSZEGO OKNA **********************************************************************************************

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[2]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(6.0,1.0, -2.0);
    glTexCoord2f(0,0);
    glVertex3f(6.0,-2.0,-2.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(5.0, -2.0, -2.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(5.0,1.0, -2.0);
    glEnd();

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[2]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(6.0,1.0, -4.0);
    glTexCoord2f(0,0);
    glVertex3f(6.0,-2.0,-4.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(5.0, -2.0, -4.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(5.0,1.0, -4.0);
    glEnd();

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[2]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(6.0,-2.0, -2.0);
    glTexCoord2f(0,0);
    glVertex3f(5.0,-2.0,-2.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(5.0, -2.0, -4.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(6.0,-2.0, -4.0);
    glEnd();

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[2]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(6.0,1.0, -2.0);
    glTexCoord2f(0,0);
    glVertex3f(5.0,1.0,-2.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(5.0, 1.0, -4.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(6.0,1.0, -4.0);
    glEnd();

    //PIERWSZE OKNo  ********************************************************************************************************
    glBindTexture (GL_TEXTURE_2D, obiektyTextur[3]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(5.0, 1.0, -2.0);
    glTexCoord2f(0,0);
    glVertex3f(5.0,-2.0,-2.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(5.0, -2.0, -4.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(5.0,1.0, -4.0);
    glEnd();

    //DACH *************************************************************************************************************************

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[0]);
    glBegin(GL_TRIANGLES);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(6.0, 7.0, -3.0);
    glTexCoord2f(0,0);
    glVertex3f(6.0, 4.0, 0.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(6.0, 4.0, -6.0);
    glEnd();


    glBindTexture (GL_TEXTURE_2D, obiektyTextur[1]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(-7.0, 7.0, -3.0);
    glTexCoord2f(0,0);
    glVertex3f(-7.0,3.0,1.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(7.0, 3.0, 1.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(7.0,7.0, -3.0);
    glEnd();


    glBindTexture (GL_TEXTURE_2D, obiektyTextur[0]);
    glBegin(GL_TRIANGLES);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(-6.0, 7.0, -3.0);
    glTexCoord2f(0,0);
    glVertex3f(-6.0, 4.0, 0.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(-6.0, 4.0, -6.0);
    glEnd();


    glBindTexture (GL_TEXTURE_2D, obiektyTextur[1]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(-7.0, 3.0, -7.0);
    glTexCoord2f(0,0);
    glVertex3f(-7.0,7.0,-3.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(7.0, 7.0, -3.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(7.0,3.0, -7.0);
    glEnd();

    //Sciana Tylnia **********************************************************************

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[0]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(-6.0,4.0, -6.0);
    glTexCoord2f(0,0);
    glVertex3f(-6.0,-4.0,-6.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(-4.0, -4.0, -6.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(-4.0,4.0, -6.0);
    glEnd();

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[0]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(-4.0,-2.0, -6.0);
    glTexCoord2f(0,0);
    glVertex3f(-4.0,-4.0,-6.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(4.0, -4.0, -6.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(4.0,-2.0, -6.0);
    glEnd();

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[0]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(-4.0,4.0, -6.0);
    glTexCoord2f(0,0);
    glVertex3f(-4.0,1.0,-6.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(4.0, 1.0, -6.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(4.0,4.0, -6.0);
    glEnd();

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[0]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(4.0,4.0, -6.0);
    glTexCoord2f(0,0);
    glVertex3f(4.0,-4.0,-6.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(6.0, -4.0, -6.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(6.0,4.0, -6.0);
    glEnd();

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[0]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(-2.0,1.0, -6.0);
    glTexCoord2f(0,0);
    glVertex3f(-2.0,-2.0, -6.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(2.0, -2.0, -6.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(2.0,1.0, -6.0);
    glEnd();

    //FRAMUGI PIERWSZEGO OKNA **********************************************************************************************

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[2]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(-2.0,1.0, -6.0);
    glTexCoord2f(0,0);
    glVertex3f(-2.0,-2.0,-6.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(-2.0, -2.0, -5.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(-2.0,1.0, -5.0);
    glEnd();

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[2]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(-4.0,1.0, -6.0);
    glTexCoord2f(0,0);
    glVertex3f(-4.0,-2.0,-6.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(-4.0, -2.0, -5.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(-4.0,1.0, -5.0);
    glEnd();

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[2]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(-4.0,1.0, -6.0);
    glTexCoord2f(0,0);
    glVertex3f(-4.0,1.0,-5.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(-2.0, 1.0, -5.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(-2.0,1.0, -6.0);
    glEnd();

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[2]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(-4.0,-2.0, -6.0);
    glTexCoord2f(0,0);
    glVertex3f(-4.0,-2.0,-5.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(-2.0, -2.0, -5.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(-2.0,-2.0, -6.0);
    glEnd();
    //PIERWSZE OKNo  ********************************************************************************************************
    glBindTexture (GL_TEXTURE_2D, obiektyTextur[3]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(-4.0, 1.0, -5.0);
    glTexCoord2f(0,0);
    glVertex3f(-4.0,-2.0,-5.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(-2.0, -2.0, -5.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(-2.0,1.0, -5.0);
    glEnd();

    //FRAMUGI DRUGIEGO OKNA **********************************************************************************************

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[2]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(2.0,1.0, -6.0);
    glTexCoord2f(0,0);
    glVertex3f(2.0,-2.0, -6.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(2.0, -2.0, -5.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(2.0,1.0, -5.0);
    glEnd();

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[2]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(4.0,1.0, -6.0);
    glTexCoord2f(0,0);
    glVertex3f(4.0,-2.0,-6.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(4.0, -2.0, -5.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(4.0,1.0, -5.0);
    glEnd();


    glBindTexture (GL_TEXTURE_2D, obiektyTextur[2]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(2.0,1.0, -6.0);
    glTexCoord2f(0,0);
    glVertex3f(2.0,1.0,-5.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(4.0, 1.0, -5.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(4.0,1.0, -6.0);
    glEnd();

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[2]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(2.0,-2.0, -6.0);
    glTexCoord2f(0,0);
    glVertex3f(2.0,-2.0,-5.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(4.0, -2.0, -5.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(4.0,-2.0, -6.0);
    glEnd();
    //DRUGIE OKNo  ********************************************************************************************************
    glBindTexture (GL_TEXTURE_2D, obiektyTextur[3]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(2.0, 1.0, -5.0);
    glTexCoord2f(0,0);
    glVertex3f(2.0,-2.0,-5.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(4.0, -2.0, -5.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(4.0,1.0, -5.0);
    glEnd();


    //Podloga ****************************************************************************************************************

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[0]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(-6.0,-4.0, -6.0);
    glTexCoord2f(0,0);
    glVertex3f(-6.0,-4.0, 0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(6.0, -4.0, 0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(6.0,-4.0, -6.0);
    glEnd();

    //Komin *******************************************************************************
    glBindTexture (GL_TEXTURE_2D, obiektyTextur[0]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(2.0,7.0, -1.0);
    glTexCoord2f(0,0);
    glVertex3f(2.0,5.0, -1.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(4.0, 5.0, -1.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(4.0,7.0, -1.0);
    glEnd();

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[0]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(2.0,7.0, -2.0);
    glTexCoord2f(0,0);
    glVertex3f(2.0,5.0, -2.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(4.0, 5.0, -2.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(4.0,7.0, -2.0);
    glEnd();

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[0]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(2.0,7.0, -2.0);
    glTexCoord2f(0,0);
    glVertex3f(2.0,5.0, -2.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(2.0, 5.0, -1.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(2.0,7.0, -1.0);
    glEnd();

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[0]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(4.0,7.0, -2.0);
    glTexCoord2f(0,0);
    glVertex3f(4.0,5.0, -2.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(4.0, 5.0, -1.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(4.0,7.0, -1.0);
    glEnd();

    //WEJSCIE *************************************************************************************************************************

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[0]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(-6.0,4.0, -2.0);
    glTexCoord2f(0,0);
    glVertex3f(-6.0,-4.0, -2.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(-6.0, -4.0, 0.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(-6.0,4.0, 0.0);
    glEnd();

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[0]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(-6.0,4.0, -4.0);
    glTexCoord2f(0,0);
    glVertex3f(-6.0,1.0, -4.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(-6.0, 1.0, -2.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(-6.0,4.0, -2.0);
    glEnd();

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[0]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(-6.0,4.0, -6.0);
    glTexCoord2f(0,0);
    glVertex3f(-6.0,-4.0, -6.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(-6.0, -4.0, -4.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(-6.0,4.0, -4.0);
    glEnd();

//Drzwi**********************************************************************************

    glBindTexture (GL_TEXTURE_2D, obiektyTextur[2]);
    glBegin(GL_QUADS);
    glNormal3f(0.0f, 1.0f, 0.0f); // okreœlenie kierunku odbijania œwiat³a
    glTexCoord2f(1,0);
    glVertex3f(-6.0, 1.0, -4.0);
    glTexCoord2f(0,0);
    glVertex3f(-6.0,-4.0, -4.0);
    glTexCoord2f(0,1);//0,1
    glVertex3f(-6.0, -4.0, -2.0);
    glTexCoord2f(1,1);//1,1
    glVertex3f(-6.0,1.0, -2.0);
    glEnd();








    glPopMatrix();
    glutSwapBuffers();
}


const GLfloat light_ambient[]  = { 0.0f, 0.0f, 0.0f, 1.0f };
const GLfloat light_specular[] = { 1.0f, 1.0f, 1.0f, 1.0f };
const GLfloat light_diffuse[]  = { 0.5f, 0.5f, 0.5f, 0.5f };
const GLfloat light_position[] = { 2.0f, 5.0f, 5.0f, 0.0f };

const GLfloat mat_ambient[]    = { 0.7f, 0.7f, 0.7f, 1.0f };
const GLfloat mat_diffuse[]    = { 0.0f, 0.0f, 0.0f, 0.0f };
const GLfloat mat_specular[]   = { 1.0f, 1.0f, 1.0f, 1.0f };
const GLfloat high_shininess[] = { 100.0f };

static void key(unsigned char key, int x, int y)
{
    switch (key)
    {
    case 27 :
    case 'q':
        exit(0);
        break;

    case '+':
        slices++;
        stacks++;
        break;
    case 'o':
        glEnable (GL_LIGHT0); // włączenie światła
        break;
    case 'k':
        glEnable (GL_LIGHT1); // włączenie światła
        break;
    case 'm':
        glDisable (GL_LIGHT0);
        break;
    case 'l':
        glDisable (GL_LIGHT1);
        break;
    case 'b':
        fMocne_swiatlo[0]+=b;
        fMocne_swiatlo[1]+=b;
        fMocne_swiatlo[2]+=b;
        fMocne_swiatlo[3]+=b;
        fSlabe_swiatlo[0]+=b;
        fSlabe_swiatlo[1]+=b;
        fSlabe_swiatlo[2]+=b;
        fSlabe_swiatlo[3]+=b;
        glLightfv (GL_LIGHT0, GL_DIFFUSE, fMocne_swiatlo);

        break;
    case 'f':
        fMocne_swiatlo[0]-=b;
        fMocne_swiatlo[1]-=b;
        fMocne_swiatlo[2]-=b;
        fMocne_swiatlo[3]-=b;
        fSlabe_swiatlo[0]-=b;
        fSlabe_swiatlo[1]-=b;
        fSlabe_swiatlo[2]-=b;
        fSlabe_swiatlo[3]-=b;
        glLightfv (GL_LIGHT0, GL_DIFFUSE, fMocne_swiatlo);

        break;

    case '-':
        if (slices>3 && stacks>3)
        {
            slices--;
            stacks--;
        }
        break;
    }

    glutPostRedisplay();
}

void klawisze_specjalne(int key, int x, int y)
{
    switch(key)
    {
    case GLUT_KEY_LEFT:
        alfa -= PI / 32;
        pointx = skok_point * cos (alfa) + eyex;
        pointz = skok_point * sin (alfa) + eyez;
        break;
    case GLUT_KEY_RIGHT:
        alfa += PI / 32;
        pointx = skok_point * cos (alfa) + eyex;
        pointz = skok_point * sin (alfa) + eyez;
        break;
    case GLUT_KEY_UP:
        skok_eye += 10.0f;
        eyex = skok_eye * cos (alfa) + eyex;
        eyez = skok_eye * sin (alfa) + eyez;
        pointx = skok_point * cos (alfa) + eyex;
        pointz = skok_point * sin (alfa) + eyez;
        skok_eye = 0.0f;
        break;
    case GLUT_KEY_DOWN:
        skok_eye -= 10.0f;
        eyex = skok_eye * cos (alfa) + eyex;
        eyez = skok_eye * sin (alfa) + eyez;
        pointx = skok_point * cos (alfa) + eyex;
        pointz = skok_point * sin (alfa) + eyez;
        skok_eye = 0.0f;
        break;
    }
    resize(glutGet(GLUT_WINDOW_WIDTH), glutGet(GLUT_WINDOW_HEIGHT));
}

static void idle(void)
{
    glutPostRedisplay();
}

void Menu (int value)
{
    switch (value)
    {
// wyjście
    case EXIT:
        exit (0);
    case FULL_WINDOW:
        skala=FULL_WINDOW;
        resize (glutGet (GLUT_WINDOW_WIDTH),glutGet (GLUT_WINDOW_HEIGHT));
        break;
    case ASPECT_1_1:
        skala=ASPECT_1_1;
        resize (glutGet (GLUT_WINDOW_WIDTH),glutGet (GLUT_WINDOW_HEIGHT));
        break;
    case ORTO:
        rzut=ORTO;
        resize (glutGet (GLUT_WINDOW_WIDTH),glutGet (GLUT_WINDOW_HEIGHT));
        break;
    case FRUST:
        rzut=FRUST;
        resize (glutGet (GLUT_WINDOW_WIDTH),glutGet (GLUT_WINDOW_HEIGHT));
        break;
    case PERSP:
        rzut=PERSP;
        resize (glutGet (GLUT_WINDOW_WIDTH),glutGet (GLUT_WINDOW_HEIGHT));
        break;
    }
}



/* Program entry point */

int main(int argc, char *argv[])
{
    glutInit(&argc, argv);
    glutInitWindowSize(600,360);
    glutInitWindowPosition(12,12);
    glutInitDisplayMode(GLUT_RGB | GLUT_DOUBLE | GLUT_DEPTH);

    glutCreateWindow("GLUT Shapes");

    glEnable(GL_TEXTURE_2D); // w³¹czenie teksturowania
    glGenTextures(LICZBA_OB_TEXTUR, obiektyTextur); /// wygenerowanie obiektów tekstur
    glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE); // ustalenie trybu œrodowiska

    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR); //linearne rozciaganie

    for (int i = 0; i < LICZBA_OB_TEXTUR; i++)
    {
        GLubyte *pBytes;
        GLint iWidth, iHeight, iComponents;
        GLenum eFormat;
        glBindTexture(GL_TEXTURE_2D, obiektyTextur[i]); // dowi¹zanie obiektów tekstur
        pBytes = glploadtga(plikiTextur[i], &iWidth, &iHeight, &iComponents, &eFormat); // Za³adowanie tekstur
        // utworzenie mipmap
        gluBuild2DMipmaps(GL_TEXTURE_2D, iComponents, iWidth, iHeight, eFormat, GL_UNSIGNED_BYTE, pBytes);
        free(pBytes); // zwolnienie pamiêci
    }

    glutReshapeFunc(resize);
    glutDisplayFunc(display);
    glutKeyboardFunc(key);
    glutSpecialFunc(klawisze_specjalne); //Kamera
    glutIdleFunc(idle);
    glutCreateMenu (Menu); // utworzenie menu podręcznego
// dodadnie pozycji do menu podręcznego

    glutAddMenuEntry ("Rodzaj skalowania - całe okno", FULL_WINDOW);
    glutAddMenuEntry ("Rodzaj skalowania - skala 1:1", ASPECT_1_1);
    glutAddMenuEntry ("Rzutowanie ortogonalne", ORTO);
    glutAddMenuEntry ("Rzutowanie frustum", FRUST);
    glutAddMenuEntry ("Rzutowanie perspective", PERSP);
    glutAddMenuEntry ("Wyjście",EXIT);
    glutAttachMenu (GLUT_RIGHT_BUTTON); // określenie przycisku myszki obsługującej menu podręczne

    glClearColor(1,1,1,1);
    //glEnable(GL_CULL_FACE);
    //glCullFace(GL_BACK);

    glEnable(GL_DEPTH_TEST);
    glDepthFunc(GL_LESS);

    //glEnable(GL_LIGHT0);
    glEnable(GL_NORMALIZE);
    glEnable(GL_COLOR_MATERIAL);
    //glEnable(GL_LIGHTING);


    //swiatlo ogolne
    glLightfv (GL_LIGHT0, GL_AMBIENT, fSlabe_swiatlo); // światło otoczenia
    glLightfv (GL_LIGHT0, GL_DIFFUSE, fMocne_swiatlo); // światło rozproszenia
    glLightfv (GL_LIGHT0, GL_SPECULAR, fMocne_swiatlo); // światło odbite
    glLightfv (GL_LIGHT0, GL_POSITION, fPozycja_swiatla); // pozycja światła
    glEnable (GL_LIGHTING); // włączenie oświetlenia
    glEnable (GL_LIGHT0); // włączenie światła 0
    //glEnable (GL_LIGHTING); // włączenie oświetlenia

    //swiatlo kieunkowe
    glLightf (GL_LIGHT1, GL_SPOT_CUTOFF, 30.0f); // reflektor o kącie rozwarcia 60 stopni
    glLightf(GL_LIGHT1,GL_SPOT_EXPONENT,5.0f); // stopień skupienia reflektora

    glLightfv (GL_LIGHT1, GL_AMBIENT, fSlabe_swiatlok); // światło otoczenia
    glLightfv (GL_LIGHT1, GL_DIFFUSE, fMocne_swiatlok); // światło rozproszenia
    glLightfv (GL_LIGHT1, GL_SPECULAR, fMocne_swiatlok); // światło odbite
    glLightfv (GL_LIGHT1, GL_POSITION, fPozycja_reflektora); // pozycja światła
    glLightfv (GL_LIGHT1, GL_SPOT_DIRECTION, fKierunek_reflektora); // kierunek w który odwrócony jest reflektor

    //glLightfv(GL_LIGHT0, GL_AMBIENT,  light_ambient);
    //glLightfv(GL_LIGHT0, GL_DIFFUSE,  light_diffuse);
    //glLightfv(GL_LIGHT0, GL_SPECULAR, light_specular);
    //glLightfv(GL_LIGHT0, GL_POSITION, light_position);

    //glMaterialfv(GL_FRONT, GL_AMBIENT,   mat_ambient);
    //glMaterialfv(GL_FRONT, GL_DIFFUSE,   mat_diffuse);
    //glMaterialfv(GL_FRONT, GL_SPECULAR,  mat_specular);
    //glMaterialfv(GL_FRONT, GL_SHININESS, high_shininess);

    glutMainLoop();

    glDeleteTextures (LICZBA_OB_TEXTUR, obiektyTextur); // usuniêcie obiektów tekstur

    return EXIT_SUCCESS;
}
