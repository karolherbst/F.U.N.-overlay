# copyright ToC

inherit toc

DESCRIPTION="a collection of simple string routines for c++ using boost and other libraries"

src_test() {
    cd "${CMAKE_BUILD_DIR}" || die
    Xemake test
}
