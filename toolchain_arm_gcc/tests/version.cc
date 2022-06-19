int main()
{
    static_assert(__GNUC__ && __cplusplus, "Invalid compiler");
	static_assert(__GNUC__ == 11, "Invalid major version");
	static_assert(__GNUC_MINOR__ == 2, "Invalid minor version");

    return 0;
}
