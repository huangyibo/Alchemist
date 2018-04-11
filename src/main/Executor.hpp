#ifndef ALCHEMIST__EXECUTOR_HPP
#define ALCHEMIST__EXECUTOR_HPP

#include <omp.h>
#include <dlfcn.h>
#include <ctime>
#include <iostream>
#include <string>
#include <unistd.h>
#include "Parameters.hpp"
#include "Library.hpp"
#include "utility/LibraryInfo.hpp"
#include "utility/logging.hpp"

namespace alchemist {

using std::string;

class Executor : public std::enable_shared_from_this<Executor>
{
public:
	MPI_Comm & world;
	MPI_Comm & peers;

	std::map<std::string, LibraryInfo> libraries;

	Executor(MPI_Comm & _world, MPI_Comm & _peers) : world(_world), peers(_peers) {}

	virtual ~Executor() {}

	virtual int start() = 0;

	void set_log(Log_ptr _log);

//	virtual int process_input_parameters(Parameters &) = 0;
//	virtual int process_output_parameters(Parameters &) = 0;

	int load_library(std::string);
	int run_task(std::string, Parameters &);
	int unload_libraries();

//	int receive_new_matrix();
//	int get_transpose();
//	int matrix_multiply();
//	int get_matrix_rows();
//	int read_HDF5();

	void deserialize_parameters(std::string, Parameters &);
	std::string serialize_parameters(const Parameters &) const;

private:
	Log_ptr log;
};

}

#endif
