import React, { Fragment, useState, useEffect } from "react";

const SearchContent = () => {
    const [searchContent, setSearchContent] = useState("");
    const [data, setData] = useState([]);
    const [currentPage, setCurrentPage] = useState(1);
    const [totalPages, setTotalPages] = useState(1);
    const [sortOrder, setSortOrder] = useState({ time: "asc", date: "asc" });
    const [visibleData, setVisibleData] = useState([]);

    // Debounce function to limit the frequency of requests
    const debounce = (func, delay) => {
        let timeoutId;
        return function (...args) {
            if (timeoutId) clearTimeout(timeoutId);
            timeoutId = setTimeout(() => {
                func.apply(this, args);
            }, delay);
        };
    };

    const fetchData = async (searchString = "") => {
        try {
            const url = searchString ? `http://localhost:5000/search/${searchString}` : "http://localhost:5000/search/all";
            const response = await fetch(url);
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            const responseData = await response.json();
            setData(responseData);
            setTotalPages(Math.ceil(responseData.length / 20));
            updateVisibleData(currentPage, responseData);
        } catch (error) {
            console.log(error.message);
        }
    };

    useEffect(() => {
        fetchData();
    }, []);

    useEffect(() => {
        // Trigger form submission whenever searchContent changes
        if (searchContent.trim() !== "") {
            // Debounce the fetchData function with a delay of 500ms
            const delayedFetchData = debounce(fetchData, 500);
            delayedFetchData(searchContent.trim());
        } else {
            fetchData();
        }
    }, [searchContent]);

    const onPageChange = (page) => {
        setCurrentPage(page);
        updateVisibleData(page, data);
    };

    const onNextPage = () => {
        if (currentPage < totalPages) {
            setCurrentPage(currentPage + 1);
            updateVisibleData(currentPage + 1, data);
        }
    };

    const onPreviousPage = () => {
        if (currentPage > 1) {
            setCurrentPage(currentPage - 1);
            updateVisibleData(currentPage - 1, data);
        }
    };

    const onSortByTime = () => {
        const sortedData = [...data].sort((a, b) => {
            if (sortOrder.time === "asc") {
                return a.created_time.localeCompare(b.created_time);
            } else {
                return b.created_time.localeCompare(a.created_time);
            }
        });
        setData(sortedData);
        setSortOrder({ ...sortOrder, time: sortOrder.time === "asc" ? "desc" : "asc" });
        updateVisibleData(currentPage, sortedData);
    };

    const onSortByDate = () => {
        const sortedData = [...data].sort((a, b) => {
            if (sortOrder.date === "asc") {
                return a.created_date.localeCompare(b.created_date);
            } else {
                return b.created_date.localeCompare(a.created_date);
            }
        });
        setData(sortedData);
        setSortOrder({ ...sortOrder, date: sortOrder.date === "asc" ? "desc" : "asc" });
        updateVisibleData(currentPage, sortedData);
    };

    const updateVisibleData = (page, data) => {
        const startIndex = (page - 1) * 20;
        const endIndex = startIndex + 20;
        const visibleData = data.slice(startIndex, endIndex);
        setVisibleData(visibleData);
    };

    const onSearchChange = (e) => {
        setSearchContent(e.target.value);
    };

    const onSubmitForm = (e) => {
        e.preventDefault();
        // No need to fetch data here, it will be handled by the useEffect
    };

    const formatDate = (dateString) => {
        const date = new Date(dateString);
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, '0');
        const day = String(date.getDate()).padStart(2, '0');
        return `${year}-${month}-${day}`;
    };

    return (
        <Fragment>
            <div className="container mt-5">
                <h1 className="text-center mb-4">Customer Search Management</h1>
                <form onSubmit={onSubmitForm} className="d-flex justify-content-center mb-4">
                    <input type="text" className="form-control mr-2" value={searchContent} onChange={onSearchChange} style={{ width: "300px" }} placeholder="Search by customer name or location" />
                    <button type="submit" className="btn btn-success">Search</button>
                </form>
                <div>
                    <table className="table">
                        <thead>
                            <tr>
                                <th>S.No</th>
                                <th>Customer Name</th>
                                <th>Age</th>
                                <th>Phone</th>
                                <th>Location</th>
                                <th onClick={onSortByTime} style={{ cursor: "pointer" }}>Created Time {sortOrder.time === "asc" ? "⌄" : "^"}</th>
                                <th onClick={onSortByDate} style={{ cursor: "pointer" }}>Created Date {sortOrder.date === "asc" ? "⌄" : "^"}</th>
                            </tr>
                        </thead>
                        <tbody>
                            {visibleData.map((customer, index) => (
                                <tr key={index}>
                                    <td>{(currentPage - 1) * 20 + index + 1}</td>
                                    <td>{customer.customer_name}</td>
                                    <td>{customer.age}</td>
                                    <td>{customer.phone}</td>
                                    <td>{customer.location}</td>
                                    <td>{customer.created_time}</td>
                                    <td>{formatDate(customer.created_date)}</td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                    <div className="d-flex justify-content-center">
                        <button onClick={onPreviousPage} className="btn btn-primary mr-2" disabled={currentPage === 1}>Previous</button>
                        {[...Array(totalPages).keys()].map((page) => (
                            <button key={page} onClick={() => onPageChange(page + 1)} className={`btn ${currentPage === page + 1 ? "btn-primary" : "btn-secondary"} mr-2`}>{page + 1}</button>
                        ))}
                        <button onClick={onNextPage} className="btn btn-primary" disabled={currentPage === totalPages}>Next</button>
                    </div>
                </div>
            </div>
        </Fragment>
    );
}

export default SearchContent;
