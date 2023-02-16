/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1

/* "%code top" blocks.  */
#line 1 "src/parser.y"

    #include <iostream>
    #include <assert.h>
    #include <string>
    #include <stack>
    #include <cstring>
    #include "parser.h"
    extern Ast ast;
    int yylex();
    int yyerror(char const*);

    ArrayType* curArrayType;
    int idx;
    int* arrayValue;
    std::stack<ArrayInitList*> arrayStack;
    std::stack<StmtNode*> whileStack;
    ArrayInitList* top;
    int leftCnt = 0;
    int whileCnt = 0;
    int paramNo = 0;

#line 90 "src/parser.cpp"




# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

#include "parser.h"
/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_ID = 3,                         /* ID  */
  YYSYMBOL_INTEGER = 4,                    /* INTEGER  */
  YYSYMBOL_IF = 5,                         /* IF  */
  YYSYMBOL_ELSE = 6,                       /* ELSE  */
  YYSYMBOL_WHILE = 7,                      /* WHILE  */
  YYSYMBOL_INT = 8,                        /* INT  */
  YYSYMBOL_VOID = 9,                       /* VOID  */
  YYSYMBOL_LPAREN = 10,                    /* LPAREN  */
  YYSYMBOL_RPAREN = 11,                    /* RPAREN  */
  YYSYMBOL_LBRACE = 12,                    /* LBRACE  */
  YYSYMBOL_RBRACE = 13,                    /* RBRACE  */
  YYSYMBOL_LBRACKET = 14,                  /* LBRACKET  */
  YYSYMBOL_RBRACKET = 15,                  /* RBRACKET  */
  YYSYMBOL_COMMA = 16,                     /* COMMA  */
  YYSYMBOL_SEMICOLON = 17,                 /* SEMICOLON  */
  YYSYMBOL_ADD = 18,                       /* ADD  */
  YYSYMBOL_SUB = 19,                       /* SUB  */
  YYSYMBOL_MUL = 20,                       /* MUL  */
  YYSYMBOL_DIV = 21,                       /* DIV  */
  YYSYMBOL_MOD = 22,                       /* MOD  */
  YYSYMBOL_OR = 23,                        /* OR  */
  YYSYMBOL_AND = 24,                       /* AND  */
  YYSYMBOL_LESS = 25,                      /* LESS  */
  YYSYMBOL_LESSEQUAL = 26,                 /* LESSEQUAL  */
  YYSYMBOL_GREAT = 27,                     /* GREAT  */
  YYSYMBOL_GREATEQUAL = 28,                /* GREATEQUAL  */
  YYSYMBOL_ASSIGN = 29,                    /* ASSIGN  */
  YYSYMBOL_EQUAL = 30,                     /* EQUAL  */
  YYSYMBOL_NOTEQUAL = 31,                  /* NOTEQUAL  */
  YYSYMBOL_NOT = 32,                       /* NOT  */
  YYSYMBOL_CONST = 33,                     /* CONST  */
  YYSYMBOL_RETURN = 34,                    /* RETURN  */
  YYSYMBOL_CONTINUE = 35,                  /* CONTINUE  */
  YYSYMBOL_BREAK = 36,                     /* BREAK  */
  YYSYMBOL_THEN = 37,                      /* THEN  */
  YYSYMBOL_YYACCEPT = 38,                  /* $accept  */
  YYSYMBOL_Program = 39,                   /* Program  */
  YYSYMBOL_Stmts = 40,                     /* Stmts  */
  YYSYMBOL_Stmt = 41,                      /* Stmt  */
  YYSYMBOL_LVal = 42,                      /* LVal  */
  YYSYMBOL_AssignStmt = 43,                /* AssignStmt  */
  YYSYMBOL_ExprStmt = 44,                  /* ExprStmt  */
  YYSYMBOL_EmptyStmt = 45,                 /* EmptyStmt  */
  YYSYMBOL_BlockStmt = 46,                 /* BlockStmt  */
  YYSYMBOL_47_1 = 47,                      /* $@1  */
  YYSYMBOL_IfStmt = 48,                    /* IfStmt  */
  YYSYMBOL_WhileStmt = 49,                 /* WhileStmt  */
  YYSYMBOL_50_2 = 50,                      /* @2  */
  YYSYMBOL_BreakStmt = 51,                 /* BreakStmt  */
  YYSYMBOL_ContinueStmt = 52,              /* ContinueStmt  */
  YYSYMBOL_ReturnStmt = 53,                /* ReturnStmt  */
  YYSYMBOL_Exp = 54,                       /* Exp  */
  YYSYMBOL_Cond = 55,                      /* Cond  */
  YYSYMBOL_PrimaryExp = 56,                /* PrimaryExp  */
  YYSYMBOL_UnaryExp = 57,                  /* UnaryExp  */
  YYSYMBOL_AddExp = 58,                    /* AddExp  */
  YYSYMBOL_MulExp = 59,                    /* MulExp  */
  YYSYMBOL_RelExp = 60,                    /* RelExp  */
  YYSYMBOL_EqExp = 61,                     /* EqExp  */
  YYSYMBOL_LAndExp = 62,                   /* LAndExp  */
  YYSYMBOL_LOrExp = 63,                    /* LOrExp  */
  YYSYMBOL_ConstExp = 64,                  /* ConstExp  */
  YYSYMBOL_FuncRParams = 65,               /* FuncRParams  */
  YYSYMBOL_Type = 66,                      /* Type  */
  YYSYMBOL_DeclStmt = 67,                  /* DeclStmt  */
  YYSYMBOL_VarDeclStmt = 68,               /* VarDeclStmt  */
  YYSYMBOL_ConstDeclStmt = 69,             /* ConstDeclStmt  */
  YYSYMBOL_VarDefList = 70,                /* VarDefList  */
  YYSYMBOL_ConstDefList = 71,              /* ConstDefList  */
  YYSYMBOL_VarDef = 72,                    /* VarDef  */
  YYSYMBOL_73_3 = 73,                      /* @3  */
  YYSYMBOL_ConstDef = 74,                  /* ConstDef  */
  YYSYMBOL_75_4 = 75,                      /* @4  */
  YYSYMBOL_FuncArrayIndices = 76,          /* FuncArrayIndices  */
  YYSYMBOL_ArrayIndices = 77,              /* ArrayIndices  */
  YYSYMBOL_InitValList = 78,               /* InitValList  */
  YYSYMBOL_ConstInitValList = 79,          /* ConstInitValList  */
  YYSYMBOL_InitVal = 80,                   /* InitVal  */
  YYSYMBOL_81_5 = 81,                      /* @5  */
  YYSYMBOL_ConstInitVal = 82,              /* ConstInitVal  */
  YYSYMBOL_83_6 = 83,                      /* @6  */
  YYSYMBOL_FuncDef = 84,                   /* FuncDef  */
  YYSYMBOL_85_7 = 85,                      /* $@7  */
  YYSYMBOL_86_8 = 86,                      /* @8  */
  YYSYMBOL_FuncFParams = 87,               /* FuncFParams  */
  YYSYMBOL_FuncFParam = 88                 /* FuncFParam  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_uint8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if !defined yyoverflow

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* !defined yyoverflow */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  57
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   222

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  38
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  51
/* YYNRULES -- Number of rules.  */
#define YYNRULES  106
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  179

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   292


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,    57,    57,    62,    63,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    79,    83,    92,   104,   110,
     116,   122,   122,   131,   136,   139,   144,   144,   157,   166,
     175,   178,   184,   188,   191,   194,   197,   203,   204,   253,
     264,   267,   271,   277,   280,   284,   290,   293,   297,   301,
     307,   310,   314,   318,   322,   328,   331,   335,   341,   344,
     350,   353,   359,   364,   367,   372,   375,   380,   381,   384,
     387,   392,   396,   399,   403,   406,   416,   427,   461,   461,
     519,   530,   530,   574,   578,   584,   588,   594,   597,   602,
     605,   610,   639,   674,   674,   709,   735,   757,   757,   792,
     797,   792,   824,   828,   831,   834,   843
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "ID", "INTEGER", "IF",
  "ELSE", "WHILE", "INT", "VOID", "LPAREN", "RPAREN", "LBRACE", "RBRACE",
  "LBRACKET", "RBRACKET", "COMMA", "SEMICOLON", "ADD", "SUB", "MUL", "DIV",
  "MOD", "OR", "AND", "LESS", "LESSEQUAL", "GREAT", "GREATEQUAL", "ASSIGN",
  "EQUAL", "NOTEQUAL", "NOT", "CONST", "RETURN", "CONTINUE", "BREAK",
  "THEN", "$accept", "Program", "Stmts", "Stmt", "LVal", "AssignStmt",
  "ExprStmt", "EmptyStmt", "BlockStmt", "$@1", "IfStmt", "WhileStmt", "@2",
  "BreakStmt", "ContinueStmt", "ReturnStmt", "Exp", "Cond", "PrimaryExp",
  "UnaryExp", "AddExp", "MulExp", "RelExp", "EqExp", "LAndExp", "LOrExp",
  "ConstExp", "FuncRParams", "Type", "DeclStmt", "VarDeclStmt",
  "ConstDeclStmt", "VarDefList", "ConstDefList", "VarDef", "@3",
  "ConstDef", "@4", "FuncArrayIndices", "ArrayIndices", "InitValList",
  "ConstInitValList", "InitVal", "@5", "ConstInitVal", "@6", "FuncDef",
  "$@7", "@8", "FuncFParams", "FuncFParam", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-132)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-100)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     186,    37,  -132,    36,    68,  -132,  -132,   122,     5,  -132,
     122,   122,   122,    57,    13,    27,    50,    91,   186,  -132,
      77,  -132,  -132,  -132,  -132,  -132,  -132,  -132,  -132,  -132,
      87,  -132,  -132,    84,    75,    19,  -132,  -132,  -132,  -132,
      45,   122,    94,   122,   122,  -132,    99,  -132,   186,  -132,
    -132,  -132,   118,  -132,   116,  -132,  -132,  -132,  -132,   122,
    -132,   122,   122,   122,   122,   122,    11,   103,  -132,  -132,
    -132,    -6,    84,   120,   122,   131,    84,    34,    83,   119,
     121,   134,  -132,   152,    12,   107,  -132,  -132,   129,    75,
      75,  -132,  -132,  -132,    80,    24,   138,   146,  -132,  -132,
     122,  -132,   135,   186,   122,   122,   122,   122,   122,   122,
     122,   122,  -132,  -132,    97,    28,   118,  -132,  -132,   139,
    -132,  -132,  -132,    57,    29,  -132,  -132,  -132,   147,    84,
      84,    84,    84,    34,    34,    83,   119,   186,   150,  -132,
    -132,  -132,  -132,  -132,    80,    80,   163,     8,  -132,   186,
    -132,  -132,    97,    97,    -1,  -132,  -132,   154,  -132,    57,
    -132,    73,  -132,  -132,  -132,    80,   157,   159,   162,  -132,
    -132,    97,  -132,  -132,   122,  -132,  -132,   160,  -132
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       0,    16,    36,     0,     0,    65,    66,     0,    21,    20,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     3,
      35,     5,     6,     8,     7,     9,    10,    11,    12,    13,
       0,    37,    46,    32,    43,     0,    14,    68,    67,    15,
       0,     0,    17,     0,     0,    35,     0,    23,     0,    40,
      41,    42,     0,    30,     0,    29,    28,     1,     4,     0,
      19,     0,     0,     0,     0,     0,    75,     0,    72,    39,
      63,     0,    62,     0,     0,     0,    50,    55,    58,    60,
      33,     0,    34,     0,     0,     0,    74,    31,     0,    44,
      45,    47,    48,    49,     0,    77,     0,     0,    69,    38,
       0,    85,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,    22,     0,     0,     0,    70,    18,    93,
      91,    76,    78,   104,    75,    71,    64,    86,    24,    51,
      52,    53,    54,    56,    57,    59,    61,     0,    97,    95,
      80,    81,    73,    92,     0,     0,     0,     0,   103,     0,
      27,    96,     0,     0,     0,    87,    79,   105,   100,     0,
      25,     0,    89,    82,    94,     0,     0,   106,     0,   102,
      98,     0,    88,    83,     0,   101,    90,     0,    84
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -132,  -132,   128,   -15,     2,  -132,  -132,  -132,     9,  -132,
    -132,  -132,  -132,  -132,  -132,  -132,    -7,   136,  -132,    17,
     -35,    66,    22,    69,    67,  -132,   -37,  -132,   -12,  -132,
    -132,  -132,  -132,  -132,    85,  -132,    65,  -132,  -132,    10,
    -132,  -132,  -131,  -132,  -117,  -132,  -132,  -132,  -132,  -132,
      33
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_uint8 yydefgoto[] =
{
       0,    17,    18,    19,    45,    21,    22,    23,    24,    48,
      25,    26,   137,    27,    28,    29,    30,    75,    31,    32,
      33,    34,    77,    78,    79,    80,   139,    71,    35,    36,
      37,    38,    67,    85,    68,   145,    86,   153,   167,    95,
     154,   161,   121,   144,   140,   152,    39,    96,   168,   147,
     148
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      46,    52,    20,    58,    73,    99,    72,    54,    76,    76,
     100,    42,   164,   155,   156,   165,     1,     2,    47,   158,
      20,   -99,    66,     7,   159,    41,    41,    49,    50,    51,
      53,    10,    11,    70,   172,   162,   163,   102,    74,    72,
      94,   114,    74,    41,    55,    12,    43,    40,     1,     2,
      20,    41,    88,   122,   176,     7,    69,   141,    94,   104,
     105,   106,   107,    10,    11,     5,     6,    56,    58,   129,
     130,   131,   132,    76,    76,    76,    76,    12,    44,    72,
      91,    92,    93,     1,     2,    20,   170,   120,   128,   171,
       7,    57,   119,   126,   115,    63,    64,    65,    10,    11,
       1,     2,    61,    62,    60,    20,    59,     7,    74,   138,
      82,   146,    12,   108,   109,    10,    11,    72,    72,    97,
      98,    84,   150,   116,   117,     1,     2,    89,    90,    12,
     133,   134,     7,    87,   160,   101,    72,   120,   120,    20,
      10,    11,   103,   110,   111,   112,   118,   146,   123,   124,
     127,    20,   143,   149,    12,     1,     2,     3,   120,     4,
       5,     6,     7,   151,     8,   113,   157,   177,   166,     9,
      10,    11,   173,   174,     8,   178,    83,   175,   136,   135,
      81,   142,   125,     0,    12,    13,    14,    15,    16,     1,
       2,     3,   169,     4,     5,     6,     7,     0,     8,     0,
       0,     0,     0,     9,    10,    11,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    12,    13,
      14,    15,    16
};

static const yytype_int16 yycheck[] =
{
       7,    13,     0,    18,    41,    11,    41,    14,    43,    44,
      16,     1,    13,   144,   145,    16,     3,     4,    13,    11,
      18,    10,     3,    10,    16,    14,    14,    10,    11,    12,
      17,    18,    19,    40,   165,   152,   153,    74,    14,    74,
      29,    29,    14,    14,    17,    32,    10,    10,     3,     4,
      48,    14,    59,    29,   171,    10,    11,    29,    29,    25,
      26,    27,    28,    18,    19,     8,     9,    17,    83,   104,
     105,   106,   107,   108,   109,   110,   111,    32,    10,   114,
      63,    64,    65,     3,     4,    83,    13,    94,   103,    16,
      10,     0,    12,   100,    84,    20,    21,    22,    18,    19,
       3,     4,    18,    19,    17,   103,    29,    10,    14,    12,
      11,   123,    32,    30,    31,    18,    19,   152,   153,    16,
      17,     3,   137,    16,    17,     3,     4,    61,    62,    32,
     108,   109,    10,    17,   149,    15,   171,   144,   145,   137,
      18,    19,    11,    24,    23,    11,    17,   159,    10,     3,
      15,   149,    13,     6,    32,     3,     4,     5,   165,     7,
       8,     9,    10,    13,    12,    13,     3,   174,    14,    17,
      18,    19,    15,    14,    12,    15,    48,   168,   111,   110,
      44,   116,    97,    -1,    32,    33,    34,    35,    36,     3,
       4,     5,   159,     7,     8,     9,    10,    -1,    12,    -1,
      -1,    -1,    -1,    17,    18,    19,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    32,    33,
      34,    35,    36
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,     3,     4,     5,     7,     8,     9,    10,    12,    17,
      18,    19,    32,    33,    34,    35,    36,    39,    40,    41,
      42,    43,    44,    45,    46,    48,    49,    51,    52,    53,
      54,    56,    57,    58,    59,    66,    67,    68,    69,    84,
      10,    14,    77,    10,    10,    42,    54,    13,    47,    57,
      57,    57,    66,    17,    54,    17,    17,     0,    41,    29,
      17,    18,    19,    20,    21,    22,     3,    70,    72,    11,
      54,    65,    58,    64,    14,    55,    58,    60,    61,    62,
      63,    55,    11,    40,     3,    71,    74,    17,    54,    59,
      59,    57,    57,    57,    29,    77,    85,    16,    17,    11,
      16,    15,    64,    11,    25,    26,    27,    28,    30,    31,
      24,    23,    11,    13,    29,    77,    16,    17,    17,    12,
      54,    80,    29,    10,     3,    72,    54,    15,    41,    58,
      58,    58,    58,    60,    60,    61,    62,    50,    12,    64,
      82,    29,    74,    13,    81,    73,    66,    87,    88,     6,
      41,    13,    83,    75,    78,    80,    80,     3,    11,    16,
      41,    79,    82,    82,    13,    16,    14,    76,    86,    88,
      13,    16,    80,    15,    14,    46,    82,    54,    15
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    38,    39,    40,    40,    41,    41,    41,    41,    41,
      41,    41,    41,    41,    41,    41,    42,    42,    43,    44,
      45,    47,    46,    46,    48,    48,    50,    49,    51,    52,
      53,    53,    54,    55,    56,    56,    56,    57,    57,    57,
      57,    57,    57,    58,    58,    58,    59,    59,    59,    59,
      60,    60,    60,    60,    60,    61,    61,    61,    62,    62,
      63,    63,    64,    65,    65,    66,    66,    67,    67,    68,
      69,    70,    70,    71,    71,    72,    72,    72,    73,    72,
      74,    75,    74,    76,    76,    77,    77,    78,    78,    79,
      79,    80,    80,    81,    80,    82,    82,    83,    82,    85,
      86,    84,    87,    87,    87,    88,    88
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     2,     4,     2,
       1,     0,     4,     2,     5,     7,     0,     6,     2,     2,
       2,     3,     1,     1,     3,     1,     1,     1,     4,     3,
       2,     2,     2,     1,     3,     3,     1,     3,     3,     3,
       1,     3,     3,     3,     3,     1,     3,     3,     1,     3,
       1,     3,     1,     1,     3,     1,     1,     1,     1,     3,
       4,     3,     1,     3,     1,     1,     3,     2,     0,     5,
       3,     0,     5,     2,     4,     3,     4,     1,     3,     1,
       3,     1,     2,     0,     4,     1,     2,     0,     4,     0,
       0,     8,     3,     1,     0,     2,     3
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)




# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)]);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep)
{
  YY_USE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */

  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */


  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2: /* Program: Stmts  */
#line 57 "src/parser.y"
            {
        ast.setRoot((yyvsp[0].stmttype));
    }
#line 1307 "src/parser.cpp"
    break;

  case 3: /* Stmts: Stmt  */
#line 62 "src/parser.y"
           {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1313 "src/parser.cpp"
    break;

  case 4: /* Stmts: Stmts Stmt  */
#line 63 "src/parser.y"
                {
        (yyval.stmttype) = new SeqNode((yyvsp[-1].stmttype), (yyvsp[0].stmttype));
    }
#line 1321 "src/parser.cpp"
    break;

  case 5: /* Stmt: AssignStmt  */
#line 69 "src/parser.y"
                 {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1327 "src/parser.cpp"
    break;

  case 6: /* Stmt: ExprStmt  */
#line 70 "src/parser.y"
               {(yyval.stmttype) = (yyvsp[0].stmttype);}
#line 1333 "src/parser.cpp"
    break;

  case 7: /* Stmt: BlockStmt  */
#line 71 "src/parser.y"
                {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1339 "src/parser.cpp"
    break;

  case 8: /* Stmt: EmptyStmt  */
#line 72 "src/parser.y"
                {(yyval.stmttype) = (yyvsp[0].stmttype);}
#line 1345 "src/parser.cpp"
    break;

  case 9: /* Stmt: IfStmt  */
#line 73 "src/parser.y"
             {(yyval.stmttype) = (yyvsp[0].stmttype);}
#line 1351 "src/parser.cpp"
    break;

  case 10: /* Stmt: WhileStmt  */
#line 74 "src/parser.y"
                {(yyval.stmttype) = (yyvsp[0].stmttype);}
#line 1357 "src/parser.cpp"
    break;

  case 11: /* Stmt: BreakStmt  */
#line 75 "src/parser.y"
                {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1363 "src/parser.cpp"
    break;

  case 12: /* Stmt: ContinueStmt  */
#line 76 "src/parser.y"
                   {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1369 "src/parser.cpp"
    break;

  case 13: /* Stmt: ReturnStmt  */
#line 77 "src/parser.y"
                 {(yyval.stmttype) = (yyvsp[0].stmttype);}
#line 1375 "src/parser.cpp"
    break;

  case 14: /* Stmt: DeclStmt  */
#line 78 "src/parser.y"
               {(yyval.stmttype) = (yyvsp[0].stmttype);}
#line 1381 "src/parser.cpp"
    break;

  case 15: /* Stmt: FuncDef  */
#line 79 "src/parser.y"
              {(yyval.stmttype) = (yyvsp[0].stmttype);}
#line 1387 "src/parser.cpp"
    break;

  case 16: /* LVal: ID  */
#line 83 "src/parser.y"
         {
        SymbolEntry* se;
        se = identifiers->lookup((yyvsp[0].strtype));
        if(se == nullptr)
            fprintf(stderr, "identifier \"%s\" is undefined\n", (char*)(yyvsp[0].strtype));
        Id *id= new Id(se);
        (yyval.exprtype) = id;
        delete [](yyvsp[0].strtype);
    }
#line 1401 "src/parser.cpp"
    break;

  case 17: /* LVal: ID ArrayIndices  */
#line 92 "src/parser.y"
                     {
        SymbolEntry* se;
        se = identifiers->lookup((yyvsp[-1].strtype));
        if(se == nullptr)
            fprintf(stderr, "identifier \"%s\" is undefined\n", (char*)(yyvsp[-1].strtype));
        Id *id= new Id(se, (yyvsp[0].exprtype));
        (yyval.exprtype) = id;
        delete [](yyvsp[-1].strtype);
    }
#line 1415 "src/parser.cpp"
    break;

  case 18: /* AssignStmt: LVal ASSIGN Exp SEMICOLON  */
#line 104 "src/parser.y"
                                {
        (yyval.stmttype) = new AssignStmt((yyvsp[-3].exprtype), (yyvsp[-1].exprtype));
    }
#line 1423 "src/parser.cpp"
    break;

  case 19: /* ExprStmt: Exp SEMICOLON  */
#line 110 "src/parser.y"
                    {
        (yyval.stmttype) = new ExprStmt((yyvsp[-1].exprtype));
    }
#line 1431 "src/parser.cpp"
    break;

  case 20: /* EmptyStmt: SEMICOLON  */
#line 116 "src/parser.y"
                {
        (yyval.stmttype) = new EmptyStmt();
    }
#line 1439 "src/parser.cpp"
    break;

  case 21: /* $@1: %empty  */
#line 122 "src/parser.y"
             {
        identifiers = new SymbolTable(identifiers);
    }
#line 1447 "src/parser.cpp"
    break;

  case 22: /* BlockStmt: LBRACE $@1 Stmts RBRACE  */
#line 125 "src/parser.y"
                   {
        (yyval.stmttype) = new CompoundStmt((yyvsp[-1].stmttype));
        SymbolTable *currentSymbolTable = identifiers;
        identifiers = identifiers->getPrev();
        delete currentSymbolTable;
    }
#line 1458 "src/parser.cpp"
    break;

  case 23: /* BlockStmt: LBRACE RBRACE  */
#line 131 "src/parser.y"
                    {
        (yyval.stmttype) = new CompoundStmt(nullptr);
    }
#line 1466 "src/parser.cpp"
    break;

  case 24: /* IfStmt: IF LPAREN Cond RPAREN Stmt  */
#line 136 "src/parser.y"
                                            {
        (yyval.stmttype) = new IfStmt((yyvsp[-2].exprtype), (yyvsp[0].stmttype));
    }
#line 1474 "src/parser.cpp"
    break;

  case 25: /* IfStmt: IF LPAREN Cond RPAREN Stmt ELSE Stmt  */
#line 139 "src/parser.y"
                                           {
        (yyval.stmttype) = new IfElseStmt((yyvsp[-4].exprtype), (yyvsp[-2].stmttype), (yyvsp[0].stmttype));
    }
#line 1482 "src/parser.cpp"
    break;

  case 26: /* @2: %empty  */
#line 144 "src/parser.y"
                               {
        WhileStmt *whileStmt = new WhileStmt((yyvsp[-1].exprtype), nullptr);
        (yyval.stmttype) = whileStmt;
        whileStack.push(whileStmt);
    }
#line 1492 "src/parser.cpp"
    break;

  case 27: /* WhileStmt: WHILE LPAREN Cond RPAREN @2 Stmt  */
#line 149 "src/parser.y"
         {
        StmtNode *whileStmt = (yyvsp[-1].stmttype); 
        ((WhileStmt*)whileStmt)->setStmt((yyvsp[0].stmttype));
        (yyval.stmttype)=whileStmt;
        whileStack.pop();
    }
#line 1503 "src/parser.cpp"
    break;

  case 28: /* BreakStmt: BREAK SEMICOLON  */
#line 157 "src/parser.y"
                      {
        if(whileStack.empty()){
            fprintf(stderr,"break stmt is not in a while stmt\n");
            assert(!whileStack.empty());
        }
        (yyval.stmttype) = new BreakStmt(whileStack.top());
    }
#line 1515 "src/parser.cpp"
    break;

  case 29: /* ContinueStmt: CONTINUE SEMICOLON  */
#line 166 "src/parser.y"
                         {
         if(whileStack.empty()){
            fprintf(stderr,"continue stmt is not in a while stmt\n");
            assert(!whileStack.empty());
        }
        (yyval.stmttype) = new ContinueStmt(whileStack.top());
    }
#line 1527 "src/parser.cpp"
    break;

  case 30: /* ReturnStmt: RETURN SEMICOLON  */
#line 175 "src/parser.y"
                       {
        (yyval.stmttype) = new ReturnStmt();
    }
#line 1535 "src/parser.cpp"
    break;

  case 31: /* ReturnStmt: RETURN Exp SEMICOLON  */
#line 178 "src/parser.y"
                           {
        (yyval.stmttype) = new ReturnStmt((yyvsp[-1].exprtype));
    }
#line 1543 "src/parser.cpp"
    break;

  case 32: /* Exp: AddExp  */
#line 184 "src/parser.y"
           {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1549 "src/parser.cpp"
    break;

  case 33: /* Cond: LOrExp  */
#line 188 "src/parser.y"
           {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1555 "src/parser.cpp"
    break;

  case 34: /* PrimaryExp: LPAREN Exp RPAREN  */
#line 191 "src/parser.y"
                        {
        (yyval.exprtype) = (yyvsp[-1].exprtype);
    }
#line 1563 "src/parser.cpp"
    break;

  case 35: /* PrimaryExp: LVal  */
#line 194 "src/parser.y"
           {
        (yyval.exprtype) = (yyvsp[0].exprtype);
    }
#line 1571 "src/parser.cpp"
    break;

  case 36: /* PrimaryExp: INTEGER  */
#line 197 "src/parser.y"
              {
        SymbolEntry* se = new ConstantSymbolEntry(TypeSystem::intType, (yyvsp[0].itype));
        (yyval.exprtype) = new Constant(se);
    }
#line 1580 "src/parser.cpp"
    break;

  case 37: /* UnaryExp: PrimaryExp  */
#line 203 "src/parser.y"
                 {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1586 "src/parser.cpp"
    break;

  case 38: /* UnaryExp: ID LPAREN FuncRParams RPAREN  */
#line 204 "src/parser.y"
                                   {
        SymbolEntry* se;
        se = identifiers->lookup((yyvsp[-3].strtype));
        if(se == nullptr)
        {
            fprintf(stderr, "function \"%s\" is undefined\n", (char*)(yyvsp[-3].strtype));
            delete [](char*)(yyvsp[-3].strtype);
            assert(se != nullptr);
        }

        //检查函数重命名
        /*
        std::vector<Type*> paramsType = ((FunctionType*)(se->getType()))->getParamsType();
        ExprNode* callParamsType = $3;
        int paramCount = 0;
        
        while(callParamsType){
            paramCount++;
            callParamsType = (ExprNode*)callParamsType->getNext();
        }
        
        while(se){
            if(((FunctionType*)(se->getType()))->getParamsType().size() == paramCount){
                break;
            }
            se = se->getNext();
        }
        if(se == nullptr){
            fprintf(stderr, "function \"%s\" having %d params, is undefined\n", (char*)$1, paramCount);
            delete [](char*)$1;
            assert(se != nullptr);
        }

        callParamsType = $3;

        for(auto &params:paramsType){
            if(params != callParamsType->getSymbolEntry()->getType()){
                 if(callParamsType->getSymbolEntry()->getType()->isArray() && params->isArray()){
                    callParamsType = (ExprNode*)callParamsType->getNext();
                    continue;
                }
                fprintf(stderr, "your param TYPE should be %s, but when you call func you use %s\n",
                        params->toStr().c_str(),callParamsType->getSymbolEntry()->getType()->toStr().c_str());
            }
            callParamsType = (ExprNode*)callParamsType->getNext();
        }
        */
        (yyval.exprtype) = new FuncExpr(se, (yyvsp[-1].exprtype));
    }
#line 1640 "src/parser.cpp"
    break;

  case 39: /* UnaryExp: ID LPAREN RPAREN  */
#line 253 "src/parser.y"
                       {
        SymbolEntry* se;
        se = identifiers->lookup((yyvsp[-2].strtype));
        if(se == nullptr)
        {
            fprintf(stderr, "function \"%s\" is undefined\n", (char*)(yyvsp[-2].strtype));
            delete [](char*)(yyvsp[-2].strtype);
            assert(se != nullptr);
        }
        (yyval.exprtype) = new FuncExpr(se);
    }
#line 1656 "src/parser.cpp"
    break;

  case 40: /* UnaryExp: ADD UnaryExp  */
#line 264 "src/parser.y"
                   {
        (yyval.exprtype) = (yyvsp[0].exprtype);
    }
#line 1664 "src/parser.cpp"
    break;

  case 41: /* UnaryExp: SUB UnaryExp  */
#line 267 "src/parser.y"
                   {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new UnaryExpr(se, UnaryExpr::SUB, (yyvsp[0].exprtype));
    }
#line 1673 "src/parser.cpp"
    break;

  case 42: /* UnaryExp: NOT UnaryExp  */
#line 271 "src/parser.y"
                   {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new UnaryExpr(se, UnaryExpr::NOT, (yyvsp[0].exprtype));
    }
#line 1682 "src/parser.cpp"
    break;

  case 43: /* AddExp: MulExp  */
#line 277 "src/parser.y"
             {
        (yyval.exprtype) = (yyvsp[0].exprtype);
    }
#line 1690 "src/parser.cpp"
    break;

  case 44: /* AddExp: AddExp ADD MulExp  */
#line 280 "src/parser.y"
                        {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::ADD, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1699 "src/parser.cpp"
    break;

  case 45: /* AddExp: AddExp SUB MulExp  */
#line 284 "src/parser.y"
                        {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::SUB, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1708 "src/parser.cpp"
    break;

  case 46: /* MulExp: UnaryExp  */
#line 290 "src/parser.y"
               {
        (yyval.exprtype) = (yyvsp[0].exprtype);
    }
#line 1716 "src/parser.cpp"
    break;

  case 47: /* MulExp: MulExp MUL UnaryExp  */
#line 293 "src/parser.y"
                          {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::MUL, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1725 "src/parser.cpp"
    break;

  case 48: /* MulExp: MulExp DIV UnaryExp  */
#line 297 "src/parser.y"
                          {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::DIV, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1734 "src/parser.cpp"
    break;

  case 49: /* MulExp: MulExp MOD UnaryExp  */
#line 301 "src/parser.y"
                          {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::MOD, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1743 "src/parser.cpp"
    break;

  case 50: /* RelExp: AddExp  */
#line 307 "src/parser.y"
             {
        (yyval.exprtype) = (yyvsp[0].exprtype);
    }
#line 1751 "src/parser.cpp"
    break;

  case 51: /* RelExp: RelExp LESS AddExp  */
#line 310 "src/parser.y"
                         {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::LESS, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1760 "src/parser.cpp"
    break;

  case 52: /* RelExp: RelExp LESSEQUAL AddExp  */
#line 314 "src/parser.y"
                              {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::LESSEQUAL, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1769 "src/parser.cpp"
    break;

  case 53: /* RelExp: RelExp GREAT AddExp  */
#line 318 "src/parser.y"
                          {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::GREAT, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1778 "src/parser.cpp"
    break;

  case 54: /* RelExp: RelExp GREATEQUAL AddExp  */
#line 322 "src/parser.y"
                               {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::GREATEQUAL, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1787 "src/parser.cpp"
    break;

  case 55: /* EqExp: RelExp  */
#line 328 "src/parser.y"
             {
        (yyval.exprtype) = (yyvsp[0].exprtype);
    }
#line 1795 "src/parser.cpp"
    break;

  case 56: /* EqExp: EqExp EQUAL RelExp  */
#line 331 "src/parser.y"
                         {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::EQUAL, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1804 "src/parser.cpp"
    break;

  case 57: /* EqExp: EqExp NOTEQUAL RelExp  */
#line 335 "src/parser.y"
                            {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::NOTEQUAL, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1813 "src/parser.cpp"
    break;

  case 58: /* LAndExp: EqExp  */
#line 341 "src/parser.y"
            {
        (yyval.exprtype) = (yyvsp[0].exprtype);
    }
#line 1821 "src/parser.cpp"
    break;

  case 59: /* LAndExp: LAndExp AND EqExp  */
#line 344 "src/parser.y"
                        {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::AND, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1830 "src/parser.cpp"
    break;

  case 60: /* LOrExp: LAndExp  */
#line 350 "src/parser.y"
              {
        (yyval.exprtype) = (yyvsp[0].exprtype);
    }
#line 1838 "src/parser.cpp"
    break;

  case 61: /* LOrExp: LOrExp OR LAndExp  */
#line 353 "src/parser.y"
                        {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::OR, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1847 "src/parser.cpp"
    break;

  case 62: /* ConstExp: AddExp  */
#line 359 "src/parser.y"
             {
        (yyval.exprtype) = (yyvsp[0].exprtype);
    }
#line 1855 "src/parser.cpp"
    break;

  case 63: /* FuncRParams: Exp  */
#line 364 "src/parser.y"
          {
        (yyval.exprtype) = (yyvsp[0].exprtype);
    }
#line 1863 "src/parser.cpp"
    break;

  case 64: /* FuncRParams: FuncRParams COMMA Exp  */
#line 367 "src/parser.y"
                            {
        (yyval.exprtype) = (yyvsp[-2].exprtype);
        (yyval.exprtype)->setNext((yyvsp[0].exprtype));
    }
#line 1872 "src/parser.cpp"
    break;

  case 65: /* Type: INT  */
#line 372 "src/parser.y"
          {
        (yyval.type) = TypeSystem::intType;
    }
#line 1880 "src/parser.cpp"
    break;

  case 66: /* Type: VOID  */
#line 375 "src/parser.y"
           {
        (yyval.type) = TypeSystem::voidType;
    }
#line 1888 "src/parser.cpp"
    break;

  case 67: /* DeclStmt: ConstDeclStmt  */
#line 380 "src/parser.y"
                    {(yyval.stmttype) = (yyvsp[0].stmttype);}
#line 1894 "src/parser.cpp"
    break;

  case 68: /* DeclStmt: VarDeclStmt  */
#line 381 "src/parser.y"
                  {(yyval.stmttype) = (yyvsp[0].stmttype);}
#line 1900 "src/parser.cpp"
    break;

  case 69: /* VarDeclStmt: Type VarDefList SEMICOLON  */
#line 384 "src/parser.y"
                                {(yyval.stmttype) = (yyvsp[-1].stmttype);}
#line 1906 "src/parser.cpp"
    break;

  case 70: /* ConstDeclStmt: CONST Type ConstDefList SEMICOLON  */
#line 387 "src/parser.y"
                                        {
        (yyval.stmttype) = (yyvsp[-1].stmttype);
    }
#line 1914 "src/parser.cpp"
    break;

  case 71: /* VarDefList: VarDefList COMMA VarDef  */
#line 392 "src/parser.y"
                              {
        (yyval.stmttype) = (yyvsp[-2].stmttype);
        (yyvsp[-2].stmttype)->setNext((yyvsp[0].stmttype));
    }
#line 1923 "src/parser.cpp"
    break;

  case 72: /* VarDefList: VarDef  */
#line 396 "src/parser.y"
             {(yyval.stmttype) = (yyvsp[0].stmttype);}
#line 1929 "src/parser.cpp"
    break;

  case 73: /* ConstDefList: ConstDefList COMMA ConstDef  */
#line 399 "src/parser.y"
                                  {
        (yyval.stmttype) = (yyvsp[-2].stmttype);
        (yyvsp[-2].stmttype)->setNext((yyvsp[0].stmttype));
    }
#line 1938 "src/parser.cpp"
    break;

  case 74: /* ConstDefList: ConstDef  */
#line 403 "src/parser.y"
               {(yyval.stmttype) = (yyvsp[0].stmttype);}
#line 1944 "src/parser.cpp"
    break;

  case 75: /* VarDef: ID  */
#line 406 "src/parser.y"
         {
        SymbolEntry* se;
        se = new IdentifierSymbolEntry(TypeSystem::intType, (yyvsp[0].strtype), identifiers->getLevel());
        if (!identifiers->install((yyvsp[0].strtype), se)){
            fprintf(stderr, "identifier \"%s\" is already defined\n", (char*)(yyvsp[0].strtype));
            assert(false);
        }
        (yyval.stmttype) = new DeclStmt(new Id(se));
        delete [](yyvsp[0].strtype);
    }
#line 1959 "src/parser.cpp"
    break;

  case 76: /* VarDef: ID ASSIGN InitVal  */
#line 416 "src/parser.y"
                        {
        SymbolEntry* se = new IdentifierSymbolEntry(TypeSystem::intType, (yyvsp[-2].strtype), identifiers->getLevel());
        if (!identifiers->install((yyvsp[-2].strtype), se)){
            fprintf(stderr, "identifier \"%s\" is already defined\n", (char*)(yyvsp[-2].strtype));
            assert(false);
        }
        //要setValue因为id可能是const的，看test案例有这种情况
        ((IdentifierSymbolEntry*)se)->setValue((yyvsp[0].exprtype)->getValue());
        (yyval.stmttype) = new DeclStmt(new Id(se), (yyvsp[0].exprtype));
        delete [](yyvsp[-2].strtype);
    }
#line 1975 "src/parser.cpp"
    break;

  case 77: /* VarDef: ID ArrayIndices  */
#line 427 "src/parser.y"
                      {
        std::vector<int> dims;
        ExprNode* ary = (yyvsp[0].exprtype);
        //计算出数组的维度
        while(ary){
            dims.push_back(ary->getValue());
            ary = (ExprNode*)(ary->getNext());
        }
        //得到正确的数组Type
        Type *type = TypeSystem::intType;
        Type* temp;
        while(!dims.empty()){
            temp = new ArrayType(type, dims.back());
            if(type->isArray())
                ((ArrayType*)type)->setArrayType(temp);
            type = temp;
            dims.pop_back();
        }
        curArrayType = (ArrayType*)type;
        
        SymbolEntry* se = new IdentifierSymbolEntry(type, (yyvsp[-1].strtype), identifiers->getLevel());

        //因为没有初始化，让其初始值为all zero
        ((IdentifierSymbolEntry*)se)->setAllZero();
        int *p = new int[type->getSize()];
        ((IdentifierSymbolEntry*)se)->setArrayValue(p);

        if (!identifiers->install((yyvsp[-1].strtype), se)){
            fprintf(stderr, "identifier \"%s\" is already defined\n", (char*)(yyvsp[-1].strtype));
            assert(false);
        }
        (yyval.stmttype) = new DeclStmt(new Id(se));
        delete [](yyvsp[-1].strtype);
    }
#line 2014 "src/parser.cpp"
    break;

  case 78: /* @3: %empty  */
#line 461 "src/parser.y"
                             {
        std::vector<int> dims;
        ExprNode* ary = (yyvsp[-1].exprtype);
        //计算出数组的维度
        while(ary){
            dims.push_back(ary->getValue());
            ary = (ExprNode*)(ary->getNext());
        }

        //得到正确的数组Type
        Type* type = TypeSystem::intType;
        Type* temp;
        //我不知道这么写为什么不对
        // for(unsigned long int i=dims.size();i>=0;i--){
        //     temp = new ArrayType(type,dims[i]);
        //     if(type->isArray()){
        //         ((ArrayType*)type)->setArrayType(temp);
        //         type = temp;
        //     }else{
        //         type = temp;
        //     }
        // }
        // curArrayType = (ArrayType*)type;

        for(auto it = dims.rbegin(); it != dims.rend(); it++) {
            temp = new ArrayType(type, *it);
            if(type->isArray()){
                ((ArrayType*)type)->setArrayType(temp);
                type = temp;
            }else{
                type = temp;
            }
        }
        curArrayType = (ArrayType*)type;

        //计算偏移量，初始化
        idx = 0;
        while(!arrayStack.empty()){
            arrayStack.pop();
        }
        SymbolEntry* se = new IdentifierSymbolEntry(type, (yyvsp[-2].strtype), identifiers->getLevel());
        (yyval.se) = se;
        arrayValue = new int[curArrayType->getSize()];
    }
#line 2063 "src/parser.cpp"
    break;

  case 79: /* VarDef: ID ArrayIndices ASSIGN @3 InitVal  */
#line 505 "src/parser.y"
              {
         if(((ArrayInitList*)(yyvsp[0].exprtype))->isEmpty())
            ((IdentifierSymbolEntry*)(yyvsp[-1].se))->setAllZero();

        ((IdentifierSymbolEntry*)(yyvsp[-1].se))->setArrayValue(arrayValue);
        if(!identifiers->install((yyvsp[-4].strtype), (yyvsp[-1].se))){
            fprintf(stderr, "identifier \"%s\" is already defined\n", (char*)(yyvsp[-4].strtype));
            assert(false);
        }
        (yyval.stmttype) = new DeclStmt(new Id((yyvsp[-1].se)), (yyvsp[0].exprtype));
        delete [](yyvsp[-4].strtype);
    }
#line 2080 "src/parser.cpp"
    break;

  case 80: /* ConstDef: ID ASSIGN ConstInitVal  */
#line 519 "src/parser.y"
                             {
        SymbolEntry* se = new IdentifierSymbolEntry(TypeSystem::constIntType, (yyvsp[-2].strtype), identifiers->getLevel());
        ((IdentifierSymbolEntry*)se)->setConst();
        if(!identifiers->install((yyvsp[-2].strtype), se)){
            fprintf(stderr, "identifier \"%s\" is already defined\n", (char*)(yyvsp[-2].strtype));
            assert(false);
        }
        ((IdentifierSymbolEntry*)se)->setValue((yyvsp[0].exprtype)->getValue());
        (yyval.stmttype) = new DeclStmt(new Id(se), (yyvsp[0].exprtype));
        delete [](yyvsp[-2].strtype);
    }
#line 2096 "src/parser.cpp"
    break;

  case 81: /* @4: %empty  */
#line 530 "src/parser.y"
                              {
        std::vector<int> dims;
        ExprNode* ary = (yyvsp[-1].exprtype);
        //计算出数组的维度
        while(ary){
            dims.push_back(ary->getValue());
            ary = (ExprNode*)(ary->getNext());
        }

        //得到正确的数组Type
        Type* type = TypeSystem::intType;
        Type* temp;
        for(auto it=dims.rbegin(); it != dims.rend(); it++) {
            temp = new ArrayType(type, *it);
            if(type->isArray()){
                ((ArrayType*)type)->setArrayType(temp);
                type = temp;
            }else{
                type = temp;
            }
        }
        curArrayType = (ArrayType*)type;

        //计算偏移量，初始化
        idx = 0;
        while(!arrayStack.empty()){
            arrayStack.pop();
        }
        SymbolEntry* se = new IdentifierSymbolEntry(type, (yyvsp[-2].strtype), identifiers->getLevel());
        ((IdentifierSymbolEntry*)se)->setConst();
        (yyval.se) = se;
        arrayValue = new int[curArrayType->getSize()];
    }
#line 2134 "src/parser.cpp"
    break;

  case 82: /* ConstDef: ID ArrayIndices ASSIGN @4 ConstInitVal  */
#line 563 "src/parser.y"
                   {
        ((IdentifierSymbolEntry*)(yyvsp[-1].se))->setArrayValue(arrayValue);
        if(!identifiers->install((yyvsp[-4].strtype), (yyvsp[-1].se))){
            fprintf(stderr, "identifier \"%s\" is already defined\n", (char*)(yyvsp[-4].strtype));
            assert(false);
        }
        (yyval.stmttype) = new DeclStmt(new Id((yyvsp[-1].se)), (yyvsp[0].exprtype));
        delete [](yyvsp[-4].strtype);
    }
#line 2148 "src/parser.cpp"
    break;

  case 83: /* FuncArrayIndices: LBRACKET RBRACKET  */
#line 574 "src/parser.y"
                        {
        //函数里的数组参数，最后一维，一定是空
        (yyval.exprtype) = new ExprNode(nullptr);
    }
#line 2157 "src/parser.cpp"
    break;

  case 84: /* FuncArrayIndices: FuncArrayIndices LBRACKET Exp RBRACKET  */
#line 578 "src/parser.y"
                                             {
        (yyval.exprtype) = (yyvsp[-3].exprtype);
        (yyval.exprtype)->setNext((yyvsp[-1].exprtype));
    }
#line 2166 "src/parser.cpp"
    break;

  case 85: /* ArrayIndices: LBRACKET ConstExp RBRACKET  */
#line 584 "src/parser.y"
                                 {
        //一般的数组，括号里一定有数值
        (yyval.exprtype) = (yyvsp[-1].exprtype);
    }
#line 2175 "src/parser.cpp"
    break;

  case 86: /* ArrayIndices: ArrayIndices LBRACKET ConstExp RBRACKET  */
#line 588 "src/parser.y"
                                              {
        (yyval.exprtype) = (yyvsp[-3].exprtype);
        (yyvsp[-3].exprtype)->setNext((yyvsp[-1].exprtype));
    }
#line 2184 "src/parser.cpp"
    break;

  case 87: /* InitValList: InitVal  */
#line 594 "src/parser.y"
              {
        (yyval.exprtype) = (yyvsp[0].exprtype);
    }
#line 2192 "src/parser.cpp"
    break;

  case 88: /* InitValList: InitValList COMMA InitVal  */
#line 597 "src/parser.y"
                                {
        (yyval.exprtype) = (yyvsp[-2].exprtype);
    }
#line 2200 "src/parser.cpp"
    break;

  case 89: /* ConstInitValList: ConstInitVal  */
#line 602 "src/parser.y"
                   {
        (yyval.exprtype) = (yyvsp[0].exprtype);
    }
#line 2208 "src/parser.cpp"
    break;

  case 90: /* ConstInitValList: ConstInitValList COMMA ConstInitVal  */
#line 605 "src/parser.y"
                                          {
        (yyval.exprtype) = (yyvsp[-2].exprtype);
    }
#line 2216 "src/parser.cpp"
    break;

  case 91: /* InitVal: Exp  */
#line 610 "src/parser.y"
          {
        (yyval.exprtype) = (yyvsp[0].exprtype);
        //数组初始化
        if(!arrayStack.empty()){
            arrayValue[idx++] = (yyvsp[0].exprtype)->getValue();
            Type* tempArr = arrayStack.top()->getSymbolEntry()->getType();
            if(tempArr == TypeSystem::intType || tempArr == TypeSystem::constIntType)
                arrayStack.top()->addChildExpr((yyvsp[0].exprtype));
            else
                while(tempArr){
                    if(((ArrayType*)tempArr)->getElementType() != TypeSystem::intType && ((ArrayType*)tempArr)->getElementType() != TypeSystem::constIntType){
                        //数组套数组
                        tempArr = ((ArrayType*)tempArr)->getElementType();
                        SymbolEntry* se = new ConstantSymbolEntry(tempArr);
                        ArrayInitList* list = new ArrayInitList(se);
                        arrayStack.top()->addChildExpr(list);
                        arrayStack.push(list);
                    }else{
                        //里面是int,则pop到高一维的数组上
                        arrayStack.top()->addChildExpr((yyvsp[0].exprtype));
                        while(arrayStack.top()->isFull() && arrayStack.size() != (long unsigned int)leftCnt){
                            tempArr = ((ArrayType*)tempArr)->getArrayType();
                            arrayStack.pop();
                        }
                        break;
                    }
                }
        }         
    }
#line 2250 "src/parser.cpp"
    break;

  case 92: /* InitVal: LBRACE RBRACE  */
#line 639 "src/parser.y"
                    {
        SymbolEntry* se;
        ExprNode* list;
        if(arrayStack.empty()){
            //直接全0
            memset(arrayValue, 0, curArrayType->getSize());
            //拿到数组的长度
            int len = curArrayType->getSize() / TypeSystem::intType->getSize();
            idx += len;
            //把数组添加到符号表
            se = new ConstantSymbolEntry(curArrayType);
            //list直接new出来一个数组类型然后将符号表项放进去
            list = new ArrayInitList(se);
        }else{
            //有初始化
            Type* type = ((ArrayType*)(arrayStack.top()->getSymbolEntry()->getType()))->getElementType();
            //同样也是把数组的长度拿到
            int len = type->getSize() / TypeSystem::intType->getSize();

            //有一些中间是0
            memset(arrayValue + idx, 0, type->getSize());
            idx += len;
            //因为只实现了int，所以就是int类型
            se = new ConstantSymbolEntry(type);
            //同理一个新类
            list = new ArrayInitList(se);
            //直接插入到语法树
            arrayStack.top()->addChildExpr(list);
            //如果说一层已经满了，就把他pop掉
            while(arrayStack.top()->isFull() && arrayStack.size() != (long unsigned int)leftCnt){
                arrayStack.pop();
            }
        }
        (yyval.exprtype) = list;
    }
#line 2290 "src/parser.cpp"
    break;

  case 93: /* @5: %empty  */
#line 674 "src/parser.y"
             {
        SymbolEntry* se;
        if(!arrayStack.empty())
            curArrayType = (ArrayType*)(((ArrayType*)(arrayStack.top()->getSymbolEntry()->getType()))->getElementType());
        se = new ConstantSymbolEntry(curArrayType);
        if(curArrayType->getElementType() != TypeSystem::intType){
            curArrayType = (ArrayType*)(curArrayType->getElementType());
        }
        ArrayInitList* expr = new ArrayInitList(se);
        if(!arrayStack.empty())
            arrayStack.top()->addChildExpr(expr);
        arrayStack.push(expr);
        (yyval.exprtype) = expr;
        leftCnt++;
    }
#line 2310 "src/parser.cpp"
    break;

  case 94: /* InitVal: LBRACE @5 InitValList RBRACE  */
#line 689 "src/parser.y"
                         {
        leftCnt--;
        while(arrayStack.top() != (yyvsp[-2].exprtype) && arrayStack.size() > (long unsigned int)(leftCnt + 1))
            arrayStack.pop();
        if(arrayStack.top() == (yyvsp[-2].exprtype))
            arrayStack.pop();
        (yyval.exprtype) = (yyvsp[-2].exprtype);
        if(!arrayStack.empty())
            while(arrayStack.top()->isFull() && arrayStack.size() != (long unsigned int)leftCnt){
                arrayStack.pop();
            }
        int size = ((ArrayType*)((yyval.exprtype)->getSymbolEntry()->getType()))->getSize()/ TypeSystem::intType->getSize();
        while(idx % size != 0)
            arrayValue[idx++] = 0;
        if(!arrayStack.empty())
            curArrayType = (ArrayType*)(((ArrayType*)(arrayStack.top()->getSymbolEntry()->getType()))->getElementType());
    }
#line 2332 "src/parser.cpp"
    break;

  case 95: /* ConstInitVal: ConstExp  */
#line 709 "src/parser.y"
               {
        (yyval.exprtype) = (yyvsp[0].exprtype);
        if(!arrayStack.empty()){
            arrayValue[idx++] = (yyvsp[0].exprtype)->getValue();
            Type* tempArr = arrayStack.top()->getSymbolEntry()->getType();
            if(tempArr == TypeSystem::constIntType)
                arrayStack.top()->addChildExpr((yyvsp[0].exprtype));
            else
                while(tempArr){
                    if(((ArrayType*)tempArr)->getElementType() != TypeSystem::constIntType){
                        tempArr = ((ArrayType*)tempArr)->getElementType();
                        SymbolEntry* se = new ConstantSymbolEntry(tempArr);
                        ArrayInitList* list = new ArrayInitList(se);
                        arrayStack.top()->addChildExpr(list);
                        arrayStack.push(list);
                    }else{
                        arrayStack.top()->addChildExpr((yyvsp[0].exprtype));
                        while(arrayStack.top()->isFull() && arrayStack.size() != (long unsigned int)leftCnt){
                            tempArr = ((ArrayType*)tempArr)->getArrayType();
                            arrayStack.pop();
                        }
                        break;
                    }
                }
        }
    }
#line 2363 "src/parser.cpp"
    break;

  case 96: /* ConstInitVal: LBRACE RBRACE  */
#line 735 "src/parser.y"
                    {
        SymbolEntry* se;
        ExprNode* list;
        if(arrayStack.empty()){
            memset(arrayValue, 0, curArrayType->getSize());
            idx += curArrayType->getSize() / TypeSystem::constIntType->getSize();
            se = new ConstantSymbolEntry(curArrayType);
            list = new ArrayInitList(se);
        }else{
            Type* type = ((ArrayType*)(arrayStack.top()->getSymbolEntry()->getType()))->getElementType();
            int len = type->getSize() / TypeSystem::constIntType->getSize();
            memset(arrayValue + idx, 0, type->getSize());
            idx += len;
            se = new ConstantSymbolEntry(type);
            list = new ArrayInitList(se);
            arrayStack.top()->addChildExpr(list);
            while(arrayStack.top()->isFull() && arrayStack.size() != (long unsigned int)leftCnt){
                arrayStack.pop();
            }
        }
        (yyval.exprtype) = list;
    }
#line 2390 "src/parser.cpp"
    break;

  case 97: /* @6: %empty  */
#line 757 "src/parser.y"
             {
        SymbolEntry* se;
        if(!arrayStack.empty())
            curArrayType = (ArrayType*)(((ArrayType*)(arrayStack.top()->getSymbolEntry()->getType()))->getElementType());
        se = new ConstantSymbolEntry(curArrayType);
        if(curArrayType->getElementType() != TypeSystem::intType){
            curArrayType = (ArrayType*)(curArrayType->getElementType());
        }
        ArrayInitList* expr = new ArrayInitList(se);
        if(!arrayStack.empty())
            arrayStack.top()->addChildExpr(expr);
        arrayStack.push(expr);
        (yyval.exprtype) = expr;
        leftCnt++;
    }
#line 2410 "src/parser.cpp"
    break;

  case 98: /* ConstInitVal: LBRACE @6 ConstInitValList RBRACE  */
#line 772 "src/parser.y"
                              {
        leftCnt--;
        while(arrayStack.top() != (yyvsp[-2].exprtype) && arrayStack.size() > (long unsigned int)(leftCnt + 1))
            arrayStack.pop();
        if(arrayStack.top() == (yyvsp[-2].exprtype))
            arrayStack.pop();
        (yyval.exprtype) = (yyvsp[-2].exprtype);
        if(!arrayStack.empty())
            while(arrayStack.top()->isFull() && arrayStack.size() != (long unsigned int)leftCnt){
                arrayStack.pop();
            }
        while(idx % (((ArrayType*)((yyval.exprtype)->getSymbolEntry()->getType()))->getSize()/ sizeof(int)) !=0 )
            arrayValue[idx++] = 0;
        if(!arrayStack.empty())
            curArrayType = (ArrayType*)(((ArrayType*)(arrayStack.top()->getSymbolEntry()->getType()))->getElementType());
    }
#line 2431 "src/parser.cpp"
    break;

  case 99: /* $@7: %empty  */
#line 792 "src/parser.y"
            {
        //new func, new symbol table
        identifiers = new SymbolTable(identifiers);
        paramNo = 0;
    }
#line 2441 "src/parser.cpp"
    break;

  case 100: /* @8: %empty  */
#line 797 "src/parser.y"
                              {
        Type* funcType;
        std::vector<Type*> vec;
        std::vector<SymbolEntry*> se_vec;
        DeclStmt* temp = (DeclStmt*)(yyvsp[-1].stmttype);
        while(temp){
            vec.push_back(temp->getId()->getSymbolEntry()->getType());
            se_vec.push_back(temp->getId()->getSymbolEntry());
            temp = (DeclStmt*)(temp->getNext());
        }
        funcType = new FunctionType((yyvsp[-5].type), vec, se_vec);
        SymbolEntry* se = new IdentifierSymbolEntry(funcType, (yyvsp[-4].strtype), identifiers->getPrev()->getLevel());
        //在前一个symboltable里插入
        if(!identifiers->getPrev()->install((yyvsp[-4].strtype), se)){
            fprintf(stderr, "redefinition func of \'%s %s\'\n", (yyvsp[-4].strtype), se->getType()->toStr().c_str());
        }
        (yyval.se) = se; 
    }
#line 2464 "src/parser.cpp"
    break;

  case 101: /* FuncDef: Type ID $@7 LPAREN FuncFParams RPAREN @8 BlockStmt  */
#line 815 "src/parser.y"
              {
        (yyval.stmttype) = new FunctionDef((yyvsp[-1].se), (DeclStmt*)(yyvsp[-3].stmttype), (yyvsp[0].stmttype));
        SymbolTable* top = identifiers;
        identifiers = identifiers->getPrev();
        delete top;
        delete [](yyvsp[-6].strtype);
    }
#line 2476 "src/parser.cpp"
    break;

  case 102: /* FuncFParams: FuncFParams COMMA FuncFParam  */
#line 824 "src/parser.y"
                                   {
        (yyval.stmttype) = (yyvsp[-2].stmttype);
        (yyval.stmttype)->setNext((yyvsp[0].stmttype));
    }
#line 2485 "src/parser.cpp"
    break;

  case 103: /* FuncFParams: FuncFParam  */
#line 828 "src/parser.y"
                 {
        (yyval.stmttype) = (yyvsp[0].stmttype);
    }
#line 2493 "src/parser.cpp"
    break;

  case 104: /* FuncFParams: %empty  */
#line 831 "src/parser.y"
             {(yyval.stmttype)=nullptr;}
#line 2499 "src/parser.cpp"
    break;

  case 105: /* FuncFParam: Type ID  */
#line 834 "src/parser.y"
              {
        SymbolEntry* se;
        se = new IdentifierSymbolEntry((yyvsp[-1].type), (yyvsp[0].strtype), identifiers->getLevel(), paramNo++);
        identifiers->install((yyvsp[0].strtype), se);
        ((IdentifierSymbolEntry*)se)->setLabel();
        ((IdentifierSymbolEntry*)se)->setAddr(new Operand(se));
        (yyval.stmttype) = new DeclStmt(new Id(se));
        delete [](yyvsp[0].strtype);
    }
#line 2513 "src/parser.cpp"
    break;

  case 106: /* FuncFParam: Type ID FuncArrayIndices  */
#line 843 "src/parser.y"
                               {

        ExprNode* t=(yyvsp[0].exprtype);
        std::vector<int> v;
        while(t!=nullptr){
            v.push_back(t->getValue());
            t=(ExprNode*)(t->getNext());
        }
        //数组基础数据类型
        Type*type=TypeSystem::intType;
        Type*temp;
        while(!v.empty()){
            //te用来接受最新的数组
            temp=new ArrayType(type,v.back());
            if(type->isArray()){
                //赋值给前一个数组
                ((ArrayType*)type)->setArrayType(temp);
            }
            type=temp;
            v.pop_back();
        }

        SymbolEntry* se = new IdentifierSymbolEntry(type, (yyvsp[-1].strtype), identifiers->getLevel(), paramNo++);
        ((IdentifierSymbolEntry*)se)->setLabel();
        ((IdentifierSymbolEntry*)se)->setAddr(new Operand(se));
        identifiers->install((yyvsp[-1].strtype), se);
        (yyval.stmttype) = new DeclStmt(new Id(se));
        delete [](yyvsp[-1].strtype);
    }
#line 2547 "src/parser.cpp"
    break;


#line 2551 "src/parser.cpp"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (YY_("syntax error"));
    }

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;
  ++yynerrs;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  YY_ACCESSING_SYMBOL (yystate), yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 872 "src/parser.y"


int yyerror(char const* message)
{
    std::cerr<<message<<std::endl;
    return -1;
}
