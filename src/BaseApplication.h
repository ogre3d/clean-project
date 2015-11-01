/*
-----------------------------------------------------------------------------
Filename:    BaseApplication.h
-----------------------------------------------------------------------------

This source file is part of the
   ___                 __    __ _ _    _ 
  /___\__ _ _ __ ___  / / /\ \ (_) | _(_)
 //  // _` | '__/ _ \ \ \/  \/ / | |/ / |
/ \_// (_| | | |  __/  \  /\  /| |   <| |
\___/ \__, |_|  \___|   \/  \/ |_|_|\_\_|
      |___/                              
      Tutorial Framework
      http://www.ogre3d.org/tikiwiki/
-----------------------------------------------------------------------------
*/
#ifndef __BaseApplication_h_
#define __BaseApplication_h_

#include <OgreCamera.h>
#include <OgreEntity.h>
#include <OgreLogManager.h>
#include <OgreRoot.h>
#include <OgreViewport.h>
#include <OgreSceneManager.h>
#include <OgreRenderWindow.h>
#include <OgreConfigFile.h>

#define OGRE_1_7_AND_MORE ((OGRE_VERSION_MAJOR == 1 && OGRE_VERSION_MINOR >= 7) || OGRE_VERSION_MAJOR > 1)
#define OGRE_1_8_AND_MORE ((OGRE_VERSION_MAJOR == 1 && OGRE_VERSION_MINOR >= 8) || OGRE_VERSION_MAJOR > 1)
#define OGRE_1_9_AND_MORE ((OGRE_VERSION_MAJOR == 1 && OGRE_VERSION_MINOR >= 9) || OGRE_VERSION_MAJOR > 1)
#define OGRE_2_0_AND_MORE (OGRE_VERSION_MAJOR >= 2)

#if OGRE_2_0_AND_MORE
#include <OgreMaterialManager.h>
#include <OgreTextureManager.h>
#include <OgreWindowEventUtilities.h>

#ifdef OGRE_STATIC_LIB
#    define OGRE_STATIC_GL
#    if OGRE_PLATFORM == OGRE_PLATFORM_WIN32
#        define OGRE_STATIC_Direct3D9
// D3D10 will only work on vista, so be careful about statically linking
#        if OGRE_USE_D3D10
#            define OGRE_STATIC_Direct3D10
#        endif
#    endif
#    define OGRE_STATIC_BSPSceneManager
#    define OGRE_STATIC_ParticleFX
#    define OGRE_STATIC_CgProgramManager
#    ifdef OGRE_USE_PCZ
#        define OGRE_STATIC_PCZSceneManager
#        define OGRE_STATIC_OctreeZone
#    else
#        define OGRE_STATIC_OctreeSceneManager
#    endif
#    include "OgreStaticPluginLoader.h"
#endif

#endif

#if OGRE_PLATFORM == OGRE_PLATFORM_APPLE && OGRE_2_0_AND_MORE
#include <OIS/OISEvents.h>
#include <OIS/OISInputManager.h>
#include <OIS/OISKeyboard.h>
#include <OIS/OISMouse.h>

#include <OGRE/SdkTrays.h>
#include <OGRE/SdkCameraMan.h>
#else
#include <OISEvents.h>
#include <OISInputManager.h>
#include <OISKeyboard.h>
#include <OISMouse.h>

#include <SdkTrays.h>
#include <SdkCameraMan.h>
#endif

class BaseApplication : public Ogre::FrameListener, public Ogre::WindowEventListener, public OIS::KeyListener, public OIS::MouseListener, OgreBites::SdkTrayListener
{
public:
    BaseApplication(void);
    virtual ~BaseApplication(void);

    virtual void go(void);

protected:
    virtual bool setup();
    virtual bool configure(void);
    virtual void chooseSceneManager(void);
    virtual void createCamera(void);
    virtual void createFrameListener(void);
    virtual void createScene(void) = 0; // Override me!
    virtual void destroyScene(void);
    virtual void createViewports(void);
    virtual void setupResources(void);
    virtual void createResourceListener(void);
    virtual void loadResources(void);

    // Ogre::FrameListener
    virtual bool frameRenderingQueued(const Ogre::FrameEvent& evt);

    // OIS::KeyListener
    virtual bool keyPressed( const OIS::KeyEvent &arg );
    virtual bool keyReleased( const OIS::KeyEvent &arg );
    // OIS::MouseListener
    virtual bool mouseMoved( const OIS::MouseEvent &arg );
    virtual bool mousePressed( const OIS::MouseEvent &arg, OIS::MouseButtonID id );
    virtual bool mouseReleased( const OIS::MouseEvent &arg, OIS::MouseButtonID id );

    // Ogre::WindowEventListener
    //Adjust mouse clipping area
    virtual void windowResized(Ogre::RenderWindow* rw);
    //Unattach OIS before window shutdown (very important under Linux)
    virtual void windowClosed(Ogre::RenderWindow* rw);

    Ogre::Root *mRoot;
    Ogre::Camera* mCamera;
    Ogre::SceneManager* mSceneMgr;
    Ogre::RenderWindow* mWindow;
    Ogre::String mResourcesCfg;
    Ogre::String mPluginsCfg;
#if OGRE_1_9_AND_MORE
	Ogre::OverlaySystem *mOverlaySystem;
    OgreBites::InputContext mInputContext;
#endif
    // OgreBites
    OgreBites::SdkTrayManager* mTrayMgr;
    OgreBites::SdkCameraMan* mCameraMan;       // basic camera controller
    OgreBites::ParamsPanel* mDetailsPanel;     // sample details panel
    bool mCursorWasVisible;                    // was cursor visible before dialog appeared
    bool mShutDown;

    //OIS Input devices
    OIS::InputManager* mInputManager;
    OIS::Mouse*    mMouse;
    OIS::Keyboard* mKeyboard;

#if OGRE_2_0_AND_MORE
    // Added for Mac compatibility
    Ogre::String                 m_ResourcePath;
#ifdef OGRE_STATIC_LIB
    Ogre::StaticPluginLoader m_StaticPluginLoader;
#endif
#endif
};

#endif // #ifndef __BaseApplication_h_
