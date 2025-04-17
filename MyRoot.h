#import <roothide.h>
#import <rootless.h>

#import <sys/syslimits.h>
#import <unistd.h>

#define ROOTHIDE_JBROOT(cPath) jbroot(cPath)
#define ROOTHIDE_JBROOT_NS(path) jbroot(path)
#define ROOTHIDE_ROOTFS(cPath) rootfs(cPath)
#define ROOTHIDE_ROOTFS_NS(path) rootfs(path)

#define LIBROOT_JBROOT(cPath) JBROOT_PATH_CSTRING(cPath)
#define LIBROOT_JBROOT_NS(path) JBROOT_PATH_NSSTRING(((NSString *)path))
#define LIBROOT_ROOTFS(cPath) ROOTFS_PATH_CSTRING(cPath)
#define LIBROOT_ROOTFS_NS(path) ROOTFS_PATH_NSSTRING(((NSString *)path))

#define ___SZ_ROOT_PATH_GENERIC(path, rhpathfunc, rlpathfunc) ({ \
    static int __rh_jbroot_length = 0; \
    if (__rh_jbroot_length == 0) { \
        __rh_jbroot_length = (int)strlen(ROOTHIDE_JBROOT("/")); \
    } \
    (__rh_jbroot_length > 1 ? rhpathfunc(path) : rlpathfunc(path)); \
})

#define SZ_JBROOT(cPath) ___SZ_ROOT_PATH_GENERIC(cPath, ROOTHIDE_JBROOT, LIBROOT_JBROOT)
#define SZ_JBROOT_NS(path) ___SZ_ROOT_PATH_GENERIC(path, ROOTHIDE_JBROOT_NS, LIBROOT_JBROOT_NS)
#define SZ_ROOTFS(cPath) ___SZ_ROOT_PATH_GENERIC(cPath, ROOTHIDE_ROOTFS, LIBROOT_ROOTFS)
#define SZ_ROOTFS_NS(path) ___SZ_ROOT_PATH_GENERIC(path, ROOTHIDE_ROOTFS_NS, LIBROOT_ROOTFS_NS)
