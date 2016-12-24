#ifndef OBJECT_H_
#define OBJECT_H_
#define _PyObject_HEAD_EXTRA
#define _PyObject_EXTRA_INIT
#define PyObject_HEAD                   \
    _PyObject_HEAD_EXTRA                \
    int ob_refcnt;               \
    struct _typeobject *ob_type;

#define PyObject_HEAD_INIT(type)        \
    _PyObject_EXTRA_INIT                \
    1, type,

#define PyVarObject_HEAD_INIT(type, size)       \
    PyObject_HEAD_INIT(type) size,

#define PyObject_VAR_HEAD               \
    PyObject_HEAD                       \
    int ob_size; /* Number of items in variable part */
#define Py_INVALID_SIZE (Py_ssize_t)-1

typedef struct _object {
    PyObject_HEAD
} PyObject;

typedef struct {
    PyObject_VAR_HEAD
} PyVarObject;

#define Py_REFCNT(ob)           (((PyObject*)(ob))->ob_refcnt)
#define Py_TYPE(ob)             (((PyObject*)(ob))->ob_type)
#define Py_SIZE(ob)             (((PyVarObject*)(ob))->ob_size)

typedef void (*destructor)(PyObject *);
typedef struct _typeobject {
    PyObject_VAR_HEAD
    const char *tp_name; /* For printing, in format "<module>.<name>" */
    Py_ssize_t tp_basicsize, tp_itemsize; /* For allocation */

    /* Methods to implement standard operations */

    destructor tp_dealloc;

} PyTypeObject;

#endif