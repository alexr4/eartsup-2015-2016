import KinectPV2.KJoint;
import KinectPV2.*;

KinectPV2 myKinect;
int nombreUtilisateurs;

User[] usersList;

void setup()
{
  size(1920, 1080, P3D);
  surface.setLocation(0, 0);

  usersList = new User[6];
  for (int i=0; i<usersList.length; i++)
  {
    usersList[i] = new User();
  }

  myKinect = new KinectPV2(this);
  myKinect.enableColorImg(true);
  myKinect.enableSkeletonColorMap(true);
  myKinect.enableBodyTrackImg(true);
  myKinect.init();
}

void draw()
{
  background(40);
  image(myKinect.getColorImage(), 0, 0);

  //Récupérer le nombre d'utilisateur
  nombreUtilisateurs = myKinect.getNumOfUsers();
  fill(255);
  textSize(20);
  text("Nombre total d'utilisateurs : "+nombreUtilisateurs, 20, height/2 - 150, 0);

  //Squelette
  ArrayList<KSkeleton> listeDesSquelettes = myKinect.getSkeletonColorMap();
  for (int i=0; i < listeDesSquelettes.size(); i++)
  {
    KSkeleton squeletteDeUnUtilisateur = (KSkeleton) listeDesSquelettes.get(i);
    if (squeletteDeUnUtilisateur.isTracked())
    {
      usersList[i].userColor = squeletteDeUnUtilisateur.getIndexColor();
      usersList[i].isTracked = true;

      KJoint[] listeDesArticulations = squeletteDeUnUtilisateur.getJoints();
      //position de la main droite
      usersList[i].handRight.x = listeDesArticulations[11].getX();
      usersList[i].handRight.y = listeDesArticulations[11].getY();
      usersList[i].handRight.z = listeDesArticulations[11].getZ();


      //position de la main gauche
      usersList[i].handLeft.x = listeDesArticulations[7].getX();
      usersList[i].handLeft.y = listeDesArticulations[7].getY();
      usersList[i].handLeft.z = listeDesArticulations[7].getZ();

      //Etat de la main droite
      usersList[i].handRightState = listeDesArticulations[11].getState();

      //Etat de la main left
      usersList[i].handLeftState = listeDesArticulations[7].getState();

      usersList[i].displayHands();
      usersList[i].etatMain(20, height/2 - 100 + i*20);
    } else
    {
      usersList[i].isTracked = false;
    }
  }
}