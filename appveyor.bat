python setup.py build_ext -i
set HYPOTHESIS_PROFILE=
python test.py
python -c "import cydoctest, pyroaring; cydoctest.testmod(pyroaring)" -v
git clean -xfd
python setup.py bdist_wheel
for %%f in (dist\pyroaring*.whl) do (pip install %%~f)
python test.py
pip uninstall -y pyroaring
git clean -xfd
python setup.py sdist
for %%f in (dist\pyroaring*.tar.gz) do (pip install %%~f)
python test.py
pip uninstall -y pyroaring
git clean -xfd